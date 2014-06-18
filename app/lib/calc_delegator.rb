class CalcDelegator
  include ExceptionHandler

  # Calc will initialize a CalcDelegator,
  # setting the real Calc as target. When we
  # run `@target.send`, we are sending the
  # real Calc the method.

  def initialize(target)
    @target = target
  end


  def method_missing(*args, &block)
    handle_calculation_exceptions do
      @target.send(*args, &block)
    end
  end

end