class ConsoleFormatter < Struct.new :format

  def present records, format = format
    Hirb::Helpers::AutoTable.render(render_each(records), fields: format.keys, resize: false)
  end

  def render_each records
    records.map { |record|
      render_record record
    }
  end

  def render_record record, format = format
    format.merge(format) do |_, expression|
      record.instance_eval expression
    end
  end
end
