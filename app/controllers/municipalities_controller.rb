class MunicipalitiesController < ApplicationController

  def show
    @muni = params[:id].titleize
  end

  def simple
    @muni = params[:id].titleize
  end

  def profile
    @muni = params[:id].titleize
  end

  def download
    @muni = params[:id].titleize
  end

end
