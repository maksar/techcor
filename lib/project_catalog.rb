class ProjectCatalog

  def initialize
    @projects = []
  end

  def projects criteria = nil
    return @projects if criteria.blank?
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
    self
  end

  def load
    @projects = Project.all
    self
  end

  def self.load
    self.new.load
  end
end