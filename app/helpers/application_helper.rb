module ApplicationHelper

  def muni_page
    @muni
  end

  def muni_or_root_path
    @muni ? municipality_path(@muni) : root_path
  end

end
