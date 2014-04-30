require 'spec_helper'

describe County do
  before do  
    @county = County.new
    @county.name = 'Suffolk County'
  end

  subject { @county }

  it { should respond_to :fips }
  it { should respond_to :name }

  it { should respond_to :municipalities }

  it { should respond_to :short_name }

  it { should be_valid }

  describe "#short_name" do
    it "should be sans county" do
      @county.short_name.should == 'Suffolk'
    end
  end

end
