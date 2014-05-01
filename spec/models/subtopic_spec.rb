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

  describe "#title" do
    context "when absent" do
      before { @subtopic.title = " " }
      it { should_not be_valid }
    end
    context "when too short" do
      before { @subtopic.title = "a" * 2 }
      it { should_not be_valid }
    end
    context "when too long" do
      before { @subtopic.title = "a" * 141 }
      it { should_not be_valid }
    end
  end

  describe "#narrative" do
    context "when absent" do
      before { @subtopic.narrative = " " }
      it { should be_valid }
    end
    context "when too short" do
      before { @subtopic.narrative = "a" * 2 }
      it { should_not be_valid }
    end
    context "when too long" do
      before { @subtopic.narrative = "a" * 8001 }
      it { should_not be_valid }
    end
  end

  describe "default scope" do
    let!(:middle_child)  { Subtopic.create(title: 'Houses', sort_order: 2) }
    let!(:last_in_line)  { Subtopic.create(title: 'Supply', sort_order: 3) }
    let!(:first_in_line) { Subtopic.create(title: 'Demand', sort_order: 1) }
    
    it "returns the smallest sort_order first" do
      Subtopic.all.first.should == first_in_line
    end

    it "returns the largest sort_order last" do
      Subtopic.all.last.should == last_in_line
    end
  end


  describe "relations to" do
    context "topics" do
      let!(:topic)   { Topic.create(title: 'Household') }

      before do
        @subtopic.save
        topic.subtopics << @subtopic
      end

      it "has the right topic" do
        @subtopic.topic.title.should == 'Household'
      end 

      context "and topic_area" do
        let!(:topic_area) { TopicArea.create(title: 'Demographics') }
        before do
          topic.save
          topic_area.topics << topic
        end

        it "has the right topic_area" do
          @subtopic.topic_area.title.should == 'Demographics'
        end
      end
      
    end
  end
end