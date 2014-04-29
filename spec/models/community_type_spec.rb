require 'spec_helper'

describe CommunityType do
  before do
    @type      = CommunityType.new
    @type.name = "Something"
    @type.abbr = "smthng"
  end

  subject { @type }
  
  it { should respond_to :name }
  it { should respond_to :abbr }

  it { should respond_to :community_subtypes }

  it { should respond_to :municipalities }
  
  it { should be_valid }
end
