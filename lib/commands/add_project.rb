class AddProject < Struct.new :name
  def call name = name
    Project.create(name: name)
  end
end