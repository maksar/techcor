class TcCli
  desc "Adds new metric to the project"
  long_desc "Allows to add new metric to the project"
  arg_name '{metric_name}'
  command :add_metric do |command|
    command.arg_name 'project name'
    command.desc 'name of the project, to which you want to add metric'
    command.flag :pn, :project_name

    command.arg_name 'metric type'
    command.desc 'type of the metric you want to add (string, number, boolean)'
    command.default_value "string"
    command.flag :mt, :metric_type

    command.action do |global, options, args|
      project_name = options[:project_name]
      metric_type = options[:metric_type]
      metric_name = args.first
      puts "Metric #{metric_name} with type #{metric_type} was successfully added to project #{project_name}." if AddMetric.new(project_name, metric_type, metric_name).call
    end
  end

end