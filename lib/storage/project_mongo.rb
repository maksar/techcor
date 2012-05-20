class Project
  include Mongoid::Document

  embeds_many :metrics
end