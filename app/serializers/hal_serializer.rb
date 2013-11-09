class HalSerializer < ActiveModel::Serializer
  include HalLinkUtils

  self.root false

  # Returns a hash representation of the serializable
  # object without the root.
  def serializable_hash
    @node = links.any? ? super.merge(_links: links) : super
  end

  def include_associations!
    return unless _associations.any?

    @node[:_embedded] = {}

    _associations.each_key do |name|
      include!(name, node: @node[:_embedded]) if include?(name)
    end
  end
end
