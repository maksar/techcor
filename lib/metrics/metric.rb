class Metric

  require_dependency "storage/metric_mongo"

  attr_accessor :name

  def initialize name = nil
    @name = name
  end

  def convert value
    value
  end
end