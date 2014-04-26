class StaticPagesController < ApplicationController

  def index ; end

  def munis
    @munis = ['Ashmont', 'Alewife', 'Bedford', 'Boxboro', 'Boston']
    render json: @munis
  end
end
