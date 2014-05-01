require 'spec_helper'

describe TopicArea do
  before { @topic_area = TopicArea.new(title: 'Demographics') }

  subject { @topic_area }

  it { should respond_to :title }
  it { should respond_to :narrative }
  it { should respond_to :sort_order }

  it { should respond_to :topics }
  it { should respond_to :subtopics }

  it { should be_valid }

  describe "#title" do
    context "when absent" do
      before { @topic_area.title = " " }
      it { should_not be_valid }
    end
    context "when too short" do
      before { @topic_area.title = "a" * 2 }
      it { should_not be_valid }
    end
    context "when too long" do
      before { @topic_area.title = "a" * 141 }
      it { should_not be_valid }
    end
  end

  describe "#narrative" do
    context "when absent" do
      before { @topic_area.narrative = " " }
      it { should be_valid }
    end
    context "when too short" do
      before { @topic_area.narrative = "a" * 2 }
      it { should_not be_valid }
    end
    context "when too long" do
      before { @topic_area.narrative = "a" * 8001 }
      it { should_not be_valid }
    end
  end

  describe "default scope" do
    let!(:middle_child)  { TopicArea.create(title: 'Houses', sort_order: 2) }
    let!(:last_in_line)  { TopicArea.create(title: 'Supply', sort_order: 3) }
    let!(:first_in_line) { TopicArea.create(title: 'Demand', sort_order: 1) }
    
    it "returns the smallest sort_order first" do
      TopicArea.all.first.should == first_in_line
    end

    it "returns the largest sort_order last" do
      TopicArea.all.last.should == last_in_line
    end
  end


  describe "relations to" do
    context "topics" do
      let(:hh)   { Topic.new(title: 'Household') }
      let(:race) { Topic.new(title: 'Race')      }

      before do
        @topic_area.save
        @topic_area.topics << hh
        @topic_area.topics << race
      end

      it "has the right topics" do
        @topic_area.topics.first.title.should == 'Household'
        @topic_area.topics.last.title.should  == 'Race'
      end 

      context "and subtopics" do
        before do
          hh.save
          hh.subtopics.create(title: 'By Type')
          hh.subtopics.create(title: 'By Size')
        end

        it "has the right subtopics" do
          @topic_area.subtopics.first.title.should == 'By Type'
          @topic_area.subtopics.last.title.should  == 'By Size'
        end
      end
      
    end
  end

end