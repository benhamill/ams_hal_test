class AuthorSerializer < HalSerializer
  attributes :name, :created_at

  link :self do |l|
    l.href Zooplankton.path_template_for(:author, id: object.id)
  end

  has_many :posts

  def created_at
    object.created_at.strftime("%b %d %Y")
  end

  def name
    "#{object.first_name} #{object.last_name}"
  end
end
