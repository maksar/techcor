class Metric

  attr_accessor :name

  def initialize name, type = Object
    @type = type
    @name = name
  end

  def validate_value value
    value.kind_of? @type
  end
end