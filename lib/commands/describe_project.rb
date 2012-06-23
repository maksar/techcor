class DescribeProject < Struct.new :project_name, :date_format
  def call formatter = formatter, records = records
    formatter.present records
  end

  def project project_name = project_name
    Project.find_by name: project_name
  end

  def records project = project
    project.metrics
  end

  def formatter format = format
    ConsoleFormatter.new format
  end

  def format date_format = date_format
    {
        'Metric' => 'name',
        'Value' => 'value',
        'Changed at' => "last_updated_at.strftime('#{date_format}')",
        'Changed by' => "last_updated_by"
    }
  end
end