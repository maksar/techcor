class Metric

  attr_accessor :name

  def initialize name
    @name = name
  end

  def convert value
    value
  end
end