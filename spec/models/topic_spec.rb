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

  describe "#title" do
    context "when absent" do
      before { @topic.title = " " }
      it { should_not be_valid }
    end
    context "when too short" do
      before { @topic.title = "a" * 2 }
      it { should_not be_valid }
    end
    context "when too long" do
      before { @topic.title = "a" * 141 }
      it { should_not be_valid }
    end
  end

  describe "#narrative" do
    context "when absent" do
      before { @topic.narrative = " " }
      it { should be_valid }
    end
    context "when too short" do
      before { @topic.narrative = "a" * 2 }
      it { should_not be_valid }
    end
    context "when too long" do
      before { @topic.narrative = "a" * 8001 }
      it { should_not be_valid }
    end
  end

  describe "default scope" do
    let!(:middle_child)  { Topic.create(title: 'Houses', sort_order: 2) }
    let!(:last_in_line)  { Topic.create(title: 'Supply', sort_order: 3) }
    let!(:first_in_line) { Topic.create(title: 'Demand', sort_order: 1) }
    
    it "returns the smallest sort_order first" do
      Topic.all.first.should == first_in_line
    end

    it "returns the largest sort_order last" do
      Topic.all.last.should == last_in_line
    end
  end


  describe "relations to" do
    context "subtopics" do
      let(:hh)   { Subtopic.new(title: 'Household') }
      let(:race) { Subtopic.new(title: 'Race')      }

      before do
        @topic.save
        @topic.subtopics << hh
        @topic.subtopics << race
      end

      it "has the right subtopics" do
        @topic.subtopics.first.title.should == 'Household'
        @topic.subtopics.last.title.should  == 'Race'
      end 

      context "topic_area" do
        let!(:topic_area) { TopicArea.create(title: 'Demographics') }
        
        before { topic_area.topics << @topic }

        it "has the right topic_area" do
          @topic.topic_area.title.should == 'Demographics'
        end
      end    
    end
  end

end