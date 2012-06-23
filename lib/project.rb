class Project
  def add_metric metric
    metrics << metric
    self
  end

  def edit_property name, value, user
    property(name).edit value, user
    self
  end

  def property name
    metrics.find_by(name: name)
  end
end
