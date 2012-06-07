class Project
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name

  embeds_many :metrics, cascade_callbacks: true
end