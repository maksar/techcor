class EditProperty < Struct.new :project_name, :metric_name, :value
  def call project = project, metric_name = metric_name, value = value
    project.edit_property metric_name, value
  end

  def project project_name = project_name
    Project.find_by(name: project_name)
  end
end