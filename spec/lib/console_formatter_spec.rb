require 'spec_helper'

describe ConsoleFormatter do
  module Hirb
    module Helpers
      module AutoTable
      end
    end
  end

  it 'renders prepared projects with help of Hirb library' do
    format = stub(:format, :keys => stub(:format_keys))
    projects = stub(:projects)

    subject.stub(:render_each => projects)

    Hirb::Helpers::AutoTable.should_receive(:render).with(projects, fields: format.keys, resize: false)

    subject.present(projects, format)
  end

  it 'renders each project in collection' do
    project = stub(:project)

    subject.should_receive(:render_project).with(project).twice
    subject.render_each([project, project])
  end

  it 'uses expressions in format to render each project' do
    expression = stub(:expression)
    format = {stub(:key) => expression}
    project = stub(:project).tap { |p| p.should_receive(:instance_eval).with(expression) }

    subject.render_project project, format
  end
end