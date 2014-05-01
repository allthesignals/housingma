require 'spec_helper'

describe Topic do
  before { @topic = Topic.new(title: 'Population') }

  subject { @topic }

  it { should respond_to :title }
  it { should respond_to :narrative }
  it { should respond_to :sort_order }

  it { should respond_to :topic_area }
  it { should respond_to :subtopics }

  it { should be_valid }
end