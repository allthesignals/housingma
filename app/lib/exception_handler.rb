module ExceptionHandler
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