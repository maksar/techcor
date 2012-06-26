class ConsoleFormatter < Struct.new :format
  include Formatter

  def present records
    Hirb::Helpers::AutoTable.render(render_each(records, format), fields: format.keys, resize: false)
  end
end
