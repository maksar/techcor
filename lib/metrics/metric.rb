class Metric

  def edit value
    values << PropertyValue.new(value: convert(value))
  end

  def convert value
    value
  end

end