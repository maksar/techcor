class ConsoleFormatter < Struct.new :format

  def present projects, format = format
    Hirb::Helpers::AutoTable.render(render_each(projects), fields: format.keys, resize: false)
  end

  def render_each projects
    projects.map { |project|
      render_project project
    }
  end

  def render_project project, format = format
    format.merge(format) do |_, expression|
      project.instance_eval expression
    end
  end
end
