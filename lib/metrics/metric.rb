class Metric

  def edit value
    values << PropertyValue.new(value: convert(value))
    self
  end

  def convert value
    value
  end

end