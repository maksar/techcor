require 'spec_helper'

describe Formatter do
  subject {
    class DummyFormatter
      include Formatter
    end.new
  }
  it 'renders each record in collection' do
    record = stub(:record)
    format = stub(:format)

    subject.should_receive(:render_record).with(record, format).twice
    subject.render_each([record, record], format)
  end

  it 'uses expressions in format to render each record' do
    expression = stub(:expression)
    format = {stub(:key) => expression}
    record = stub(:record).tap { |p| p.should_receive(:instance_eval).with(expression) }

    subject.render_record record, format
  end

end