class ApplicationResource
  include Alba::Resource
  # For Alba, we recommend using the `helper` method instead of `include`.
  # See the documentation: https://github.com/okuramasafumi/alba/blob/main/README.md#helper
  helper Typelizer::DSL
end
