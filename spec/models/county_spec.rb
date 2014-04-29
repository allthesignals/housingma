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

  it { should be_valid }

end
