class AddProject < Struct.new :name
  def call
    Project.new(name: name).tap { |p| p.save }
  end
end