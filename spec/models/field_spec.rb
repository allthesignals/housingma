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
  it { should respond_to :operation }

  it { should respond_to :full_alias }
  it { should respond_to :with_op }

  it { should respond_to :topic }
  it { should respond_to :subtopic }

  it { should respond_to :to_s }

  it { should be_valid }

  describe "#title" do
    context "when absent" do
      before { @field.title = " " }
      it { should_not be_valid }
    end
    context "when one character" do
      before { @field.title = "o" }
      it { should be_valid }
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

  describe "#operation" do
    context "when absent" do
      before { @field.operation = " " }
      it { should_not be_valid }
    end
    context "when not in the list" do
      wrong_operations = %w( log ln polarize )
      wrong_operations.each do |wrong_op|
        before { @field.operation = wrong_op }
        it { should_not be_valid }
      end
    end
    context "when in the list" do
      operations = %w( average total median )
      operations.each do |op|
        before { @field.operation = op }
        it { should be_valid }
      end
    end
  end

  describe "#full_alias" do
    before do
      @field.title = "unit_per_vl"
      @field.alias = "Units Per Volume"
      @field.operation = "total"
    end
    its(:full_alias) { should == "Total Units Per Volume"}
  end

  describe "#with_op" do
    before do
      @field.title = "unit_per_vl"
      @field.alias = "Units Per Volume"
      @field.operation = "total"
    end
    its(:with_op) { should == "total_unit_per_vl" }
  end

end