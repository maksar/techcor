class BooleanMetric < Metric

  def convert value
    !!value
  end

end