require 'spec_helper'

describe Municipality do
  before { @muni = Municipality.new(name: 'Ashmont') }

  subject { @muni }

  it { should respond_to :muni_id }
  it { should respond_to :name }
  it { should respond_to :geom }

  it { should respond_to :community_subtype }
  it { should respond_to :community_type }

  it { should respond_to :subregions }
  it { should respond_to :subregion_name }

  it { should be_valid }

end
