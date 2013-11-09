class HalArraySerializer < ActiveModel::ArraySerializer
  include HalLinkUtils

  self.root = false
  class_attribute :_embedded_resource_name

  class << self
    # Defines the root used on serialization. If false, disables the root.
    def embedded_resource_name(name)
      self._embedded_resource_name = name
    end
    alias_method :embedded_resource_name=, :embedded_resource_name
  end

  private

  def _serializable_array
    hash = {}

    hash[:_links] = links if links.any?
    hash[:_embedded] =  { embedded_resource_name => super }

    hash
  end

  def embedded_resource_name
    name = object.klass.name.demodulize.underscore.pluralize

    if self._embedded_resource_name == true
      name
    else
      self._embedded_resource_name || name
    end
  end
end
