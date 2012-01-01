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

  def add_metric metric
    @metrics[metric.name] = metric
  end

  def edit_property name, value
    raise UnknownMetric unless @metrics[name]
    return unless value_valid? name, value

    (@properties[name] ||= []) << value
    value
  end

  def property_history name
    raise UnknownMetric unless @metrics[name]

    @properties[name]
  end

  private

  def value_valid? name, value
    @metrics[name].validate_value value
  end
end
