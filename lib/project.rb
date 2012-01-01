class Project
  class UnknownMetric < Exception
  end

  def initialize
    @metrics = {}
    @properties = {}
  end

  def describe
    @metrics.to_a
  end

  def add_metric name, value
    @metrics[name] = value
  end

  def edit_property name, value
    raise UnknownMetric unless @metrics[name]

    (@properties[name] ||= []) << value
    value
  end

  def property_history name
    raise UnknownMetric unless @metrics[name]

    @properties[name]
  end
end
