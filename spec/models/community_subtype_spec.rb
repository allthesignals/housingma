require 'spec_helper'

describe CommunitySubtype do
  before do
    @subtype      = CommunitySubtype.new
    @subtype.name = "Something"
    @subtype.abbr = "smthg"
  end

  subject { @subtype }
  
  it { should respond_to :name }
  it { should respond_to :abbr }

  it { should respond_to :community_type }
  
  it { should respond_to :municipalities }
  
  it { should be_valid }
end
