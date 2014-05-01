require 'spec_helper'

describe State do
  before do  
    @state = State.new
    @state.name = 'Massachusetts'
    @state.abbr = 'MA'
    @state.fips = '25'
  end

  subject { @state }

  it { should respond_to :name }
  it { should respond_to :abbr }
  it { should respond_to :fips }

  it { should respond_to :municipalities }

  it { should be_valid }
end
