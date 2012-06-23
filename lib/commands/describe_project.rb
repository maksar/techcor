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
    #TODO i18n
    {'Metric' => 'name', 'Value' => 'value', 'Changed at' => "created_at.strftime('#{date_format}')", 'Changed by' => "'TODO'"}
  end
end