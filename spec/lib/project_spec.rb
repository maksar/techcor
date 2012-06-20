require 'spec_helper'

describe Project do

  describe 'metrics' do
    it 'describes itself' do
      subject.
          add_metric(Metric.new(:name => stub)).
          add_metric(Metric.new(:name => stub))

      subject.metrics.should have(2).items
    end
  end

  describe 'properties' do
    context 'with one metric' do
      let(:name) { stub(:name) }
      let(:metric) { Metric.new(name: name) }
      before { subject.add_metric(metric) }

      it 'converts value before addition' do
        value = stub
        metric.should_receive(:convert).with(value)
        subject.edit_property(name, value)
      end

      it 'returns last value of the property history' do
        value = 'v'
        subject.edit_property(name, stub).edit_property(name, value)
        subject.property(name).value.should be value
      end

      it 'returns history of the property' do
        subject.edit_property(name, stub).edit_property(name, stub)

        subject.property_history(name).should have_exactly(2).items
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

      it 'returns nil for unknown property' do
        subject.property(stub).should be_nil
      end
    end
  end
end