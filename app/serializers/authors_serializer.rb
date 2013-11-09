class AuthorsSerializer < HalArraySerializer
  link :self do |author_serializer|
    {
      href: Zooplankton.path_template_for(:authors),
    }
  end
end
