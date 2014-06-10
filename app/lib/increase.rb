module Increase

  #  Possible values for options:
  #  
  #  tense: 
  #    present: 'increase',   'decrease' 
  #    past:    'increased',  'decreased'
  #    gerund:  'increasing', 'decreasing'
  #  article:
  #    indefinite: 'an increase', 'a decrease'
  #  suffix:
  #    of:
  #      number:  'an increase of 25'
  #      percent: 'a decrease of 9%'
  #    by:
  #      number:  'increased by 25'
  #      percent: 'decreased by 9%'
  #
  #  Usage:
  #
  #  incr(2, 12, suffix: { by: :percent } )
  #    => "increased by 500 percent"
  #
  #  incr(-90,   suffix: { of: :number } )
  #    => "a decrease of 90"

  def initialize(number, *args)
    @number        = number
    @second_number = args.length > 1 ? args.shift : nil
    @options       = args.shift
    @nums          = [@number, @second_number]

    result = self.increase_decrease
  end



  def incr(number, *args)
    number        = number
    second_number = args.length > 1 ? args.shift : nil
    options       = args.shift

    result = increase_decrease(number, second_number)
    
    tensify(result, options[:tense])  if options[:tense]
    suffix(result,  options[:suffix]) if options[:suffix]
  end


  def increase_decrease(num, num2)
    if @second_number.nil?
      result = @number > 0
    else
      result = @second_number > @number
    end
  end


  def tensify(string, tense)
    short_string = string[0..-2]
    string = short_string + 'ing' if tense == :gerund
    string = short_string + 'ed'  if tense == :past
    string
  end


  def suffixize(string, suffix)
    by_suffix(string, suffix[:by]) if suffix[:by]
    of_suffix if suffix[:of]
  end


  def by_suffix(string, by)         # 'increase'
    string = tensify(string, :past) # 'increased'
    string += "by #{delta(num, num2)}" if by[:number]
    string += "by #{percent(num, num2)} percent" if by[:percent]
  end


  def by_suffix(string, by)         # 'increase'
    string = tensify(string, :past) # 'increased'
    string += "by #{delta(num, num2)}" if by[:number]
    string += "by #{percent(num, num2)} percent" if by[:percent]
  end


  def delta(num, num2)
    (num.to_i - num2.to_i).abs
  end


  def percent(num, num2)
    ((num2-num).to_f / num) * 100
  end

end