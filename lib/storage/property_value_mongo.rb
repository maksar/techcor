class PropertyValue
  include Mongoid::Document
  include Mongoid::Timestamps

  field :value
  field :created_by
  validates :created_by, presence: true

  embedded_in :metric
end