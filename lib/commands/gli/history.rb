class TechcorCli
  desc "Displays property history"
  long_desc "Displays one or more properties history (list of values over time)"
  arg_name '[{property}],[{another_property}],[...]'
  command :history do |command|
    command.arg_name 'project name'
    command.desc 'name of the project, property of which you want to edit'
    command.flag :pn, :project_name

    command.arg_name 'date format'
    command.desc 'ruby date format to display time of change'
    command.default_value "%d-%m-%Y"
    command.flag :df, :date_format

    command.action do |global, options, args|
      puts ViewHistory.new(options[:project_name], options[:date_format], args.first.try(:split, ',')).call
    end
  end
end