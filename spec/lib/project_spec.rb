$LOAD_PATH.unshift(File.expand_path('../../', File.dirname(__FILE__)))

require 'lib/project'

describe Project do

  describe 'metrics' do
    it 'describes itself' do
      2.times { subject.add_metric(stub(:name => stub)) }
      subject.describe.should have(2).items
    end
  end

  describe 'properties' do
    context 'with one metric' do
      let(:name) { stub }
      let(:metric) { Metric.new(name) }
      before { subject.add_metric(metric) }

      it 'allows to modify existing property' do
        value = stub
        subject.edit_property(name, value).should be value
      end

      it 'returns property history' do
        subject.edit_property(name, value1 = stub)
        subject.edit_property(name, value2 = stub)

        subject.property_history(name).should include value1
        subject.property_history(name).should include value2
      end

      it 'validates property before adding it' do
        subject.stub(:value_valid? => false)
        subject.edit_property(name, stub).should be_false
      end
    end

    describe 'exceptional cases' do
      it 'do not allow to modify unknown property' do
        name, value = stub, stub
        expect { subject.edit_property(name, value) }.to raise_error
      end

      it 'do not return history for non-existing property' do
        expect { subject.property_history(stub) }.to raise_error
      end
    end
  end
end