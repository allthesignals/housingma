require 'spec_helper'

describe Topic do
  before { @topic = Topic.new(title: 'Population') }

  subject { @topic }

  it { should respond_to :title }
  it { should be_valid }

  before do 
  	@subtopic = Subtopic.new(title: 'Household Something')
  	@topic_area = Topic.new(title: 'Population')
  end
end