module MunicipalitiesHelper
  def trim(float)
    ("%#g" % float).gsub(/0*$/, '')
  end
end
