class ViewHistory < Struct.new :project_name, :date_format, :properties
  def call formatter = formatter, records = records
    formatter.present records
  end

  def project project_name = project_name
    Project.find_by name: project_name
  end

  def records metrics = metrics
    metrics.collect(&:values).flatten
  end

  def formatter format = format
    ConsoleFormatter.new format
  end

  def properties project = project
    self[:properties] || project.metrics.collect(&:name)
  end

  def metrics project = project, properties = properties
    properties.map do |property|
      begin
        project.find_metric property
      rescue Project::UnknownMetric
        nil
      end
    end.compact
  end

  def format date_format = date_format, metrics = metrics
    {'Date' => "created_at.strftime('#{date_format}')"}.merge Hash[metrics.map { |m| [m.name, "metric.name == '#{m.name}' ? value : ''"] }]
  end
end