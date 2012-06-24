class EditProperty < Struct.new :project_name, :metric_name, :value, :author
  def call project = project, metric_name = metric_name, value = value, author = author
    project.edit_property(metric_name, value, author)
  end

  def project project_name = project_name
    Project.find_by(name: project_name)
  end
end