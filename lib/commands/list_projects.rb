class ListProjects < Struct.new :format, :criteria
  def call formatter = formatter, projects = projects
    formatter.present(projects)
  end

  def projects catalog = ProjectCatalog.load, criteria = criteria
    catalog.projects criteria
  end

  def formatter(console_formatter = ConsoleFormatter, format = format ? eval(format) : default_format)
    console_formatter.new(format)
  end

  def default_format projects = projects
    {'Name' => 'name'}.merge Hash[projects.collect(&:metrics).flatten.collect(&:name).flatten.map { |n| [n, "property('#{n}').try(:value)"] }]
  end

end