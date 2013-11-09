class AuthorSerializer < HalSerializer
  attributes :name, :created_at

  def created_at
    object.created_at.strftime("%b %d %Y")
  end

  def name
    "#{object.first_name} #{object.last_name}"
  end
end
