class PostSerializer < HalSerializer
  attributes :title, :body

  link :self do |l|
    l.href post_path(object)
  end
end
