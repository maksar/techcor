desc "Adds new project"
long_desc "Allows to create new project"
arg_name '{project_name}'
command :add do |command|
  command.action do |global, options, args|
    AddProject.new(args.first).call
  end
end
