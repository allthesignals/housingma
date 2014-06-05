module MunicipalitiesHelper
  def trim(number)
    ("%#g" % number.to_f).gsub(/0*$/, '')
  end

  def moe_or_blank(object, field_name)
    if object.has_attribute?("#{field_name}_me")
      moe = object.send "#{field_name}_me"
      "&plusmn; #{ "%.0f" % moe }".html_safe unless moe.nil? # format or nil
    end
  end

  def field_count
    Field.count
  end
end
