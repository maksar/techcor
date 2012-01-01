class ProjectCatalog

  def initialize
    @projects = []
  end

  def projects
    @projects
  end

  def add_project project
    @projects << project
  end
end