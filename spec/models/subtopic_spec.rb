require 'spec_helper'

describe Subtopic do
  before { @subtopic = Subtopic.new(title: 'Population') }

  subject { @subtopic }

  it { should respond_to :title }
  it { should respond_to :narrative }
  it { should respond_to :sort_order }

  it { should respond_to :topic_area }
  it { should respond_to :topic }

  it { should be_valid }
end