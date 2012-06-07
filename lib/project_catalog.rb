class ProjectCatalog

  def initialize
    @projects = []
  end

  def projects criteria = nil
    return @projects unless criteria
    @projects.find_all { |project|
      project.instance_eval criteria
    }
  end

  def add_project project
    @projects << project
    self
  end

  def save
    @projects.all? &:save
  end

  def load
    @projects = Project.all
  end
end