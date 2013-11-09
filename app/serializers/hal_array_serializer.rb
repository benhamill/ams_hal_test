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
    { _embedded: { embedded_resource_name => super } }.tap do |obj|
      obj[:_links] = links if links.any?
    end
  end

  def embedded_resource_name
    name = object.table.name

    if self._embedded_resource_name == true
      name
    else
      self._embedded_resource_name || name
    end
  end
end
