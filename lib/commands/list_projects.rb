class ListProjects < Struct.new :format, :criteria
  def call formatter = formatter, projects = projects
    formatter.present(projects)
  end

  def projects catalog = ProjectCatalog.load, criteria = criteria
    catalog.projects criteria
  end

  def formatter(console_formatter = ConsoleFormatter, format = eval(format))
    console_formatter.new(format)
  end
end