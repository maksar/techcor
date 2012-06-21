class ListProjects < Struct.new :format, :criteria
  def call formatter = formatter, projects = projects
    formatter.present(projects)
  end

  def projects catalog = ProjectCatalog.load, criteria = criteria
    catalog.projects criteria
  end

  def formatter(format = format ? eval(format) : default_format)
    ConsoleFormatter.new format
  end

  def default_format projects = projects
    {'name' => 'name'}.merge Hash[projects.collect(&:metrics).flatten.collect(&:name).flatten.map { |n| [n, "property('#{n}').try(:value)"] }]
  end

end