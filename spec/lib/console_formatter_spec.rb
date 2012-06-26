require 'spec_helper'

describe ConsoleFormatter do
  it 'renders prepared records with help of Hirb library' do
    format = stub(:format, :keys => stub(:format_keys))
    records = stub(:records)

    formatter = ConsoleFormatter.new(format)
    formatter.stub(:render_each => records)

    Hirb::Helpers::AutoTable.should_receive(:render).with(records, fields: format.keys, resize: false)

    formatter.present(records)
  end

end