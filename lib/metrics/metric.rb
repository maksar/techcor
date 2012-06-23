class Metric

  def edit value
    values << PropertyValue.new(value: convert(value))
    self
  end

  def value
    values.last.value
  end

  def convert value
    value
  end

end