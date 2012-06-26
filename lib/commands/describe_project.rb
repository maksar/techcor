class DescribeProject < Struct.new :project_name, :date_format
  def call formatter_class = ConsoleFormatter, records = records
    formatter(formatter_class).present records
  end

  def project project_name = project_name
    Project.find_by name: project_name
  end

  def records project = project
    project.metrics
  end

  def formatter formatter_class, format = format
    formatter_class.new format
  end

  def format date_format = date_format
    {
        'Metric' => 'name',
        'Value' => 'last_value',
        'Changed at' => "last_updated_at.try :strftime, '#{date_format}'",
        'Changed by' => "last_updated_by"
    }
  end
end