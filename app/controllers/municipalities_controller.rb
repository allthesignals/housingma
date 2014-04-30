class MunicipalitiesController < ApplicationController

  def show
    @muni = Municipality.find_by_name(params[:id].titleize)
  end

  def simple
    @muni = Municipality.find_by_name(params[:id].titleize)
  end

  def profile
    @muni    = Municipality.find_by_name(params[:id].titleize)
    @profile = Profile.new( @muni )
  end

  def download
    @muni = Municipality.find_by_name(params[:id].titleize)
  end

end
