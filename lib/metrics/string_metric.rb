class StringMetric < Metric
  def convert value
    value.to_s
  end
end