class Project

  class UnknownMetric < Exception ; end

  def add_metric metric
    metrics << metric
    self
  end

  def edit_property name, value
    find_metric(name).edit value
    self
  end

  def property name
    find_metric(name).values.last
  rescue UnknownMetric
    nil
  end

  def find_metric name
    metrics.detect { |metric| metric.name == name } || raise(UnknownMetric)
  end
end
