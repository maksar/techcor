class TcCli
  desc "Edits one metric of the project"
  long_desc "Allows to edit one of the project's metrics"
  arg_name '{value}'
  command :edit_property do |command|
    command.arg_name 'project name'
    command.desc 'name of the project, property of which you want to edit'
    command.flag :pn, :project_name

    command.arg_name 'metric name'
    command.desc 'name of the metric, which you want to edit'
    command.flag :mn, :metric_name

    command.action do |global, options, args|
      project_name = options[:project_name]
      metric_name = options[:metric_name]
      value = args.first
      puts "Metric #{metric_name} in project #{project_name} now has value #{value}." if EditProperty.new(project_name, metric_name, value, `whoami`).call
    end
  end

end