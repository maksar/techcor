class Metric

  require_dependency "storage/metric_mongo"

  def initialize *args
    values = []
    super *args
  end

  def edit value
    property_value = PropertyValue.new value: convert(value), created_at: Time.now
    values << property_value
  end

  def convert value
    value
  end

end