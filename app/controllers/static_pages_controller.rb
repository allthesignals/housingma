class StaticPagesController < ApplicationController

  def contact ; end

  def guide ; end

  def help ; end

  def index ; end

  


  def munis
    render json: Municipality.unscoped.order(:id).pluck(:name)
  end
end
