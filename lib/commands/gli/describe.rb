desc "Describes current state of the project"
long_desc "Displays current metrics of the project, date and author of last modification"
arg_name '{project_name}'
command :describe do |command|
  command.arg_name 'date format'
  command.desc 'ruby date format to display time of change'
  command.default_value "%d-%m-%Y"
  command.flag :df, :date_format

  command.action do |global, options, args|
    puts DescribeProject.new(args.first, options[:date_format]).call
  end
end
