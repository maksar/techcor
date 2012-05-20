class Project
  include Mongoid::Document

  embeds_many :metrics
  embeds_many :properties
end