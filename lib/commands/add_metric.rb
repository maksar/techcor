class AddMetric < Struct.new :project_name, :type, :name
  def call project = project, metric = metric
    project.add_metric(metric).save
  end

  def project project_name = project_name
    Project.find_by(name: project_name)
  end

  def metric metric_class = metric_class, name = name
    metric_class.new name: name
  end

  def metric_class type = type
    "#{type}Metric".classify.constantize
  end
end