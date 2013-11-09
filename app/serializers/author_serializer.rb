class AuthorSerializer < HalSerializer
  attributes :name, :created_at

  link :self do |author_serializer|
    {
      href: Zooplankton.path_template_for(:author, id: author_serializer.object.id),
    }
  end

  def created_at
    object.created_at.strftime("%b %d %Y")
  end

  def name
    "#{object.first_name} #{object.last_name}"
  end
end
