require 'spec_helper'

describe Quotation do
  before { @quotation = Quotation.new(quote: "This is an excellent tool.", author: "Matt Gardner", agency: "Metropolitan Area Planning Council", sort_order: 1)}
  
  subject { @quotation }

  it { should respond_to :quote }
  it { should respond_to :author }
  it { should respond_to :agency }
  it { should respond_to :sort_order }

  describe "#quote" do
    context "when absent" do
      before { @quotation.quote = " " }
      it { should_not be_valid }
    end
    context "when one character" do
      before { @quotation.quote = "o" }
      it { should_not be_valid }
    end
    context "when too long" do
      before { @quotation.quote = "a" * 1701 }
      it { should_not be_valid }
    end
  end

  describe "#author" do
    context "when absent" do
      before { @quotation.author = " " }
      it { should_not be_valid }
    end
    context "when one character" do
      before { @quotation.author = "o" }
      it { should_not be_valid }
    end
    context "when too long" do
      before { @quotation.author = "a" * 101 }
      it { should_not be_valid }
    end
  end

  describe "#agency" do
    context "when absent" do
      before { @quotation.agency = " " }
      it { should be_valid }
    end
    context "when one character" do
      before { @quotation.agency = "o" }
      it { should_not be_valid }
    end
    context "when too long" do
      before { @quotation.agency = "a" * 181 }
      it { should_not be_valid }
    end
  end

  describe "#latest" do
    context "when absent" do
      before { @quotation.published = true }
      it { should be_valid }
    end
  end
end