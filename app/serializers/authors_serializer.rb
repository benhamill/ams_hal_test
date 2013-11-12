class AuthorsSerializer < HalArraySerializer
  link :self, href: Zooplankton.path_template_for(:authors)
end
