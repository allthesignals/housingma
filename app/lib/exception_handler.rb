module ExceptionHandler

  # Include in a delegator to a class in order to
  # rescue all errors of a certain type for every
  # method in that class.

  # Used in Calc, CalcDelegator. Also included in CommonFacade.

  # Thanks to [@shime](https://github.com/shime) for the answer on StackOverflow:
  # http://stackoverflow.com/questions/16567243/rescue-all-errors-of-a-specific-type-inside-a-module

  extend ActiveSupport::Concern


  included do
    include ActiveSupport::Rescuable
    rescue_from StandardError, with: :known_error
  end


  def handle_calculation_exceptions
    yield
  rescue => e
    'N/A'
  end


  def handle_template_exceptions
    yield
  rescue => e
    nil
  end


  def known_error(e)
    Rails.logger.error "[ExceptionHandler] Exception #{e.class}: #{e.message}"
  end
end