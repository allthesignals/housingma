require 'spec_helper'

describe Region do
  before do  
    @region = Region.new
    @region.name = 'MAPC'
  end

  subject { @region }

  it { should respond_to :rpa_name }
  it { should respond_to :name }
  it { should respond_to :abbr }
  it { should respond_to :municipalities }

  it { should be_valid }
end
