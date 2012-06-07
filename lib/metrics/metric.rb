class Metric

  require_dependency "storage/metric_mongo"

  def edit value
    values << PropertyValue.new(value: convert(value), created_at: Time.now)
  end

  def convert value
    value
  end

end