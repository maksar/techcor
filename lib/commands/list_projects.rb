class ListProjects < Struct.new :format, :criteria
  def call formatter_class = formatter_class, projects = projects
    formatter(formatter_class).present projects
  end

  def projects catalog = ProjectCatalog.load, criteria = criteria
    catalog.projects criteria
  end

  def formatter(formatter_class, format = format.present? ? eval(format) : default_format)
    formatter_class.new format
  end

  def default_format projects = projects
    {'Name' => 'name'}.merge list_properties_format properties
  end

  private

  def list_properties_format properties
    Hash[properties.map { |p| [p, "property('#{p}').try :last_value"] }]
  end

  def properties
    metrics.collect(&:name).flatten
  end

  def metrics
    projects.collect(&:metrics).flatten
  end

end