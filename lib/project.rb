class Project

  require_dependency "storage/project_mongo"

  class UnknownMetric < Exception;
  end

  def initialize *args
    metrics = []
    super *args
  end

  def describe
    metrics
  end

  def add_metric metric
    metrics << metric
    self
  end

  def edit_property name, value
    raise UnknownMetric unless find_metric name

    find_metric(name).edit value
    self
  end

  def property name
    raise UnknownMetric unless find_metric name

    find_metric(name).values.last
  end

  def property_history name
    raise UnknownMetric unless find_metric name

    find_metric(name).values
  end

  private

  def find_metric name
    metrics.detect { |metric| metric.name == name }
  end

end
