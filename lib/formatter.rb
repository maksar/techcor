module Formatter
  def render_each records, format
    records.map { |record|
      render_record record, format
    }
  end

  def render_record record, format
    format.merge(format) do |_, expression|
      record.instance_eval expression
    end
  end

end