module MunicipalitiesHelper
  def trim(float)
    ("%#g" % float).gsub(/0*$/, '')
  end

  def moe_or_blank(object, field_name)
    moe = object.send "#{field_name}_me"
    "&plusmn; #{ "%.0f" % moe }".html_safe unless moe.nil? # format or nil
  end

  def field_count
    Field.count
  end
end
