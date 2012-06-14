class ConsoleFormatter
  def initialize format
    @format = format
  end

  def present projects
    Hirb::Helpers::AutoTable.render(
        projects.map { |project|
          @format.merge(@format) { |_, expression|
            project.instance_eval expression
          }
        }, :fields => @format.keys
    )
  end
end
