module HalLinkUtils
  extend ActiveSupport::Concern

  included do
    class_attribute :_links
    self._links = []
  end

  module ClassMethods #:nodoc:
    def link(rel, options={})
      if block_given?
        define_method("_generate_#{rel}_link") do
          builder = LinkBuilder.new
          instance_exec builder, &Proc.new
          builder.to_h
        end
      else
        define_method("_generate_#{rel}_link") do
          builder = LinkBuilder.new
          builder.href options[:href]
          builder.templated if options[:templated]
          builder.to_h
        end
      end

      self._links << rel

      # protect inheritance chains and open classes
      # if a serializer inherits from another OR
      #  attributes are added later in a classes lifecycle
      # poison the cache
      define_method :_fast_links do
        raise NameError
      end
    end
  end

  # Returns a hash representation of the serializable
  # object links.
  def links
    _fast_links
  rescue NameError
    method = "def _fast_links\n"

    method << "  h = {}\n"

    _links.each do |rel|
      if respond_to?("_generate_#{rel}_link")
        method << "  h[:\"#{rel}\"] = _generate_#{rel}_link\n"
      end
    end
    method << "  h\nend"

    self.class.class_eval method
    _fast_links
  end

  class LinkBuilder
    def href(href)
      @href = href
    end

    def templated
      @templated = true
    end

    def templated?
      !!@templated
    end

    def to_h
      hash = {}

      hash[:href] = @href.to_s
      hash[:templated] = true if templated?

      hash
    end
  end
end
