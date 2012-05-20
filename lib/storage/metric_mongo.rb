class Metric
  include Mongoid::Document

  field :name

  embedded_in :project

  embeds_many :values, class_name: 'PropertyValue'
end