class TcCli
  desc "List projects from catalog"
  long_desc "Lists projects from catalog matching specified criteria"
  arg_name '{criteria}'
  command :list do |command|
    command.arg_name 'table format'
    command.desc 'ruby code for table format'
    command.flag :fm, :format

    command.action do |global, options, args|
      puts ListProjects.new(options[:format], args.first).call
    end
  end
end
