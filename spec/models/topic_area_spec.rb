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

  describe "relates" do
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

      context "subtopics" do

        before do
          hh.save
          hh.subtopics.create(title: 'By Type')
          hh.subtopics.create(title: 'By Size')
        end

        it "has the right subtopic" do
          @topic_area.subtopics.first.title.should == 'By Type'
          @topic_area.subtopics.last.title.should  == 'By Size'
        end
      end
      
    end
  end

end