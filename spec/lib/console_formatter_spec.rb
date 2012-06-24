require 'spec_helper'

describe ConsoleFormatter do
  it 'renders prepared records with help of Hirb library' do
    format = stub(:format, :keys => stub(:format_keys))
    records = stub(:records)

    subject.stub(:render_each => records)

    Hirb::Helpers::AutoTable.should_receive(:render).with(records, fields: format.keys, resize: false)

    subject.present(records, format)
  end

  it 'renders each record in collection' do
    record = stub(:record)

    subject.should_receive(:render_record).with(record).twice
    subject.render_each([record, record])
  end

  it 'uses expressions in format to render each record' do
    expression = stub(:expression)
    format = {stub(:key) => expression}
    record = stub(:record).tap { |p| p.should_receive(:instance_eval).with(expression) }

    subject.render_record record, format
  end
end