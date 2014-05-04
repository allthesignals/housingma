module ApplicationHelper

  def muni_page
    return @muni         if @muni
    return @profile.muni if @profile
    return @report.muni  if @report
  end

  def muni_or_root_path
    muni_page ? municipality_path(muni_page) : root_path
  end

end
