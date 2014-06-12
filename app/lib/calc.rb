class Calc

  # Calculates the difference between two numbers
  # and presents it in a form appropriate for a view.

=begin

  Calc.new(-3).change(context: :by)            # => 'decreased by 3'
  Calc.new(1, 20).percent_change(context: :by) # => 'increased by 2000%'

  Calc.new(2).change(context: :of)              # => 'an increase of 2'
  Calc.new(2, 1).percent_change(context: :of)   # => 'a decrease of 50%'

=end

  def initialize(*args)
    @number        = args.shift.to_f
    @second_number = args.shift.to_f unless args.empty?
    @nums          = [@number, @second_number]
    @phrase        = increase_or_decrease
  end


  def percent_change_increase(options={})
    percent_rep = options.fetch(:percent) { " percent" }
    "#{increase(options)} #{percent_change_text(options)}"
  end


  def percent_increase(options={})
    "#{increase(options)} #{percent_text(options)}"
  end


  def number_increase(options={})
    "#{increase(options)} #{value_of_change}"
  end


  def percent_text(options={})
    percent_rep = options.fetch(:percent) { " percent" }
    "#{ percent(options).abs.round }" << percent_rep
  end


  def percent_change_text(options={})
    percent_rep = options.fetch(:percent) { " percent" }
    "#{ percent_change(options).abs.round }" << percent_rep
  end


  def percent(options={})
    assert_two_numbers
    value = @number / @second_number
    value *= 100 if options.fetch(:multiply) { true }
  end


  def percent_change(options={})
    assert_two_numbers
    value = (@second_number - @number) / @number
    value *= 100 if options.fetch(:multiply) { true }
  end


  def increase(options={})
    @phrase  = contextualize(@phrase, options)
  end


  def more
    @phrase = more_or_fewer
    "#{value_of_change} #{@phrase}"
  end


  private

    def value_of_change
      value = @second_number ? (@second_number - @number).abs : @number
      value.abs.round
    end


    def increase_or_decrease
      if @second_number.nil?
        @number > 0 ? 'increase' : 'decrease'
      else
        @second_number > @number ? 'increase' : 'decrease' 
      end
    end

    def more_or_fewer
      if @second_number.nil?
        @number > 0 ? 'more' : 'fewer'
      else
        @second_number > @number ? 'more' : 'fewer' 
      end
    end


    def contextualize(phrase, options)
      context = options.fetch(:context) {:by} # default to context: :by
      past    = options[:tense] == :past ? 'd' : ''
      
      return "#{phrase}#{past}"            if context == :none
      result = "#{phrase}#{past} by"       if context == :by
      result = "#{phrase.indefinitize} of" if context == :of
      result
    end


    def assert_two_numbers
      error_message = """
        Must have two positive numbers to calculate the percent change.
        Try `Calc.new(num,another_num).the_method_you_called`
      """
      if @nums.include? nil || @number >= 0 || @second_number >= 0
        raise ArgumentError, error_message
      end
    end


end