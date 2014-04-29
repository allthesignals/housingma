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

  it { should respond_to :total_ro }
  # it { should respond_to :average_ro }
  # it { should respond_to :median_ro }

  # it { should respond_to :total_ro_80_me }
  # it { should respond_to :average_ro_80_me }
  # it { should respond_to :median_ro_80_me }

  it { should be_valid }

  # describe "ghost methods" do

  #   let!(:ashmont) { Municipality.create(name: 'Ashmont') }
  #   let!(:alewife) { Municipality.create(name: 'Alewife') }
  #   let!(:bedford) { Municipality.create(name: 'Bedford') }

  #   let!(:ash_housing) { HousingData.create }
  #   let!(:ale_housing) { HousingData.create }
  #   let!(:bed_housing) { HousingData.create }

  #   before do
  #     @region.save

  #     ash_housing.update_attribute(:ro, 1)
  #     ale_housing.update_attribute(:ro, 1)
  #     bed_housing.update_attribute(:ro, 1)

  #     ashmont.housing_data = ash_housing ; ashmont.save
  #     alewife.housing_data = ale_housing ; alewife.save
  #     bedford.housing_data = bed_housing ; bedford.save

  #     @region.municipalities << ashmont
  #     @region.municipalities << alewife
  #     @region.municipalities << bedford
  #   end

  #   it "#total_ro" do
  #     puts @region.municipalities.first.housing_data.inspect
  #     @region.total_ro.should == 3.0
  #   end
  # end

end
