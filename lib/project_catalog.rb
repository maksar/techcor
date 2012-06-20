class ProjectCatalog

  def initialize
    @projects = []
  end

  def projects criteria = nil
    result = @projects.sort_by(&:name)

    return result if criteria.blank?
    result.find_all { |project|
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