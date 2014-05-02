require 'spec_helper'

describe Field do
  before { @field = Field.new(title: 'pop', alias: 'Population') }

  subject { @field }

  it { should respond_to :name }
  it { should respond_to :title }
  it { should respond_to :alias }
  it { should respond_to :narrative }
  it { should respond_to :description }
  it { should respond_to :sort_order }

  it { should respond_to :topic }
  it { should respond_to :subtopic }

  it { should be_valid }

  describe "#title" do
    context "when absent" do
      before { @field.title = " " }
      it { should_not be_valid }
    end
    context "when too short" do
      before { @field.title = "a" * 2 }
      it { should_not be_valid }
    end
    context "when too long" do
      before { @field.title = "a" * 141 }
      it { should_not be_valid }
    end
  end

  describe "#alias" do
    context "when absent" do
      before { @field.alias = " " }
      it { should_not be_valid }
    end
    context "when too short" do
      before { @field.alias = "a" * 2 }
      it { should_not be_valid }
    end
    context "when too long" do
      before { @field.alias = "a" * 8001 }
      it { should_not be_valid }
    end
  end

  describe "#narrative" do
    context "when absent" do
      before { @field.narrative = " " }
      it { should be_valid }
    end
    context "when too short" do
      before { @field.narrative = "a" * 2 }
      it { should_not be_valid }
    end
    context "when too long" do
      before { @field.narrative = "a" * 8001 }
      it { should_not be_valid }
    end
  end
end