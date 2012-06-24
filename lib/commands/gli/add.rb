class TcCli
  desc "Adds new project"
  long_desc "Allows to create new project"
  arg_name '{project_name}'
  command :add do |command|
    command.action do |global, options, args|
      name = args.first
      puts "Project #{name} was successfully added." if AddProject.new(name).call
    end
  end

end