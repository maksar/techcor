class Project
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  validates :name, uniqueness: true

  embeds_many :metrics, cascade_callbacks: true
end