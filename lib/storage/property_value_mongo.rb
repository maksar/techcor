class PropertyValue
  include Mongoid::Document

  field :value
  field :created_at

  embedded_in :metric
end