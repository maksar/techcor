class Project

  class UnknownMetric < Exception ; end

  require_dependency "storage/project_mongo"

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
  end

  def property_history name
    find_metric(name).values
  end

  private

  def find_metric name
    metrics.detect { |metric| metric.name == name } || raise(UnknownMetric)
  end
end
