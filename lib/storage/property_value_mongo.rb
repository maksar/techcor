class PropertyValue
  include Mongoid::Document
  include Mongoid::Timestamps

  field :value

  embedded_in :metric
end