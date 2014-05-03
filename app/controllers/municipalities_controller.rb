class MunicipalitiesController < ApplicationController

  def show
    @muni = Municipality.find_by_name(params[:id].titleize)
  end

  def report
    @report = Report.new( Municipality.find_by_name(params[:id].titleize) )
  end

  def profile
    @profile = Profile.new( Municipality.find_by_name(params[:id].titleize) )
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
