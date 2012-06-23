class Project
  def add_metric metric
    metrics << metric
    self
  end

  def edit_property name, value
    property(name).edit value
    self
  end

  def property name
    metrics.find_by(name: name)
  end
end
