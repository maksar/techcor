class Project

  require_dependency "storage/project_mongo"

  class UnknownMetric < Exception ; end

  def initialize
    @metrics = {}
    @properties = {}
  end

  def describe
    @metrics
  end

  def add_metric metric
    @metrics[metric.name] = metric
    self
  end

  def edit_property name, value
    raise UnknownMetric unless @metrics[name]

    (@properties[name] ||= []) << Property.new(@metrics[name].convert(value), Time.now)
    self
  end

  def property name
    property_history(name).last
  end

  def property_history name
    raise UnknownMetric unless @metrics[name]

    @properties[name]
  end

end
