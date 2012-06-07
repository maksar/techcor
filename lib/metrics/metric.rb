class Metric

  require_dependency "storage/metric_mongo"

  def edit value
    values << PropertyValue.new(value: convert(value))
  end

  def convert value
    value
  end

end