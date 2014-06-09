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



  # 
  # 
  # Possible values for options:
  # tense: 
  #   present: 'increase',   'decrease' 
  #   past:    'increased',  'decreased'
  #   gerund:  'increasing', 'decreasing'
  # article:
  #   indefinite: 'an increase', 'a decrease'
  # of:
  #   number:  'an increase of 25',  'a decrease of 9'
  #   percent: 'an increase of 12%', 'a decrease of 40%'

  def increasing(number, second_number=0, options={})
    if second_number == 0
      result = number > second_number ? 'increase' : 'decrease'
    else
      result = number < second_number ? 'increase' : 'decrease'
    end
    result = tense?(result, options)
    result = indefinite?(result, options)
    result = of?(result, number, second_number, options)
  end

  
  def tense?(string, options={})
    string = string[0..-2] + 'ing' if options[:tense] == :gerund
    string = string[0..-2] + 'ed'  if options[:tense] == :past
    string
  end


  def indefinite?(string, options={})
    if options[:article] == :indefinite || options[:of] == :number || options[:of] == :percent
      string = string.indefinitize
    end
    string
  end


  def of?(string, number, second, options={})
    string = string += " of #{(number - second).abs}" if options[:of] == :number
    if options[:of] == :percent
      percent = ((second - number).to_f / number).to_f.abs * 100
      string  = string += " of #{percent}%"
    end
    string
  end

end
