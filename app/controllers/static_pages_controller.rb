class StaticPagesController < ApplicationController

  layout 'static_pages'

  def about ; end

  def help ; end

  def index
    render layout: 'application'
  end

  def guide
    render layout: 'application'
  end

  def download
    render 'municipalities/download'
  end
  


  def munis
    render json: Municipality.unscoped.order(:id).pluck(:name)
  end
end
