# Be sure to restart your server when you modify this file.

# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf
# Mime::Type.register_alias "text/html", :iphone

Mime::Type.register "application/hal+json", :hal

ActionController.add_renderer(Mime::HAL.symbol) do |resource, options|
  serialized = ActiveModel::Serializer.build_json(self, resource, options)

  if serialized
    self.content_type ||= Mime::HAL
    serialized.to_json
  else
    _render_option_json(resource, options)
  end
end

module ActiveModel::ArraySerializerSupport
  if "".respond_to?(:safe_constantize)
    def active_model_serializer
      "#{klass.name.pluralize}Serializer".safe_constantize
    end
  else
    def active_model_serializer
      begin
        "#{klass.name.pluralize}Serializer".constantize
      rescue NameError => e
        raise unless e.message =~ /uninitialized constant/
      end
    end
  end
end
