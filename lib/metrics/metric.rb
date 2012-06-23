class Metric

  def edit value, user
    values << PropertyValue.new(value: convert(value), created_by: user)
    self
  end

  def value
    values.last.value
  end

  def last_updated_by
    values.last.created_by
  end

  def last_updated_at
    values.last.created_at
  end

  def convert value
    value
  end

end