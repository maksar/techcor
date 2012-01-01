class Project
  def initialize
    @metrics = {}
  end

  def describe
    @metrics.to_a
  end

  def add_metric name, value
    @metrics[name] = value
  end

  def metric name
    @metrics[name]
  end
end
