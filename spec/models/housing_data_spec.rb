require 'spec_helper'

describe HousingData do
  before { @data = HousingData.new }

  subject { @data }

  it { should respond_to :muni_id }
  it { should respond_to :ro }
  it { should respond_to :ag_ro8_me }

  it { should respond_to :municipality }

  it { should be_valid }
end
