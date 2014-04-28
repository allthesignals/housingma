class StaticPagesController < ApplicationController

  def contact ; end

  def guide ; end

  def help ; end

  def index ; end

  


  def munis
    @munis = ['Ashmont', 'Alewife', 'Bedford', 'Boxboro', 'Boston']
    render json: @munis
  end
end
