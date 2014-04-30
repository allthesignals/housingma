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


  def form
    @muni = Municipality.find_by_name(params[:id].titleize)
    if @muni 
      redirect_to municipality_path(@muni)
    else
      redirect_to root_path
    end
  end

end
