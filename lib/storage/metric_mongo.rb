class Metric
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  validates :name, uniqueness: true

  embedded_in :project

  embeds_many :values, class_name: 'PropertyValue', cascade_callbacks: true
end