class Api::WebhooksController < ApplicationController
  # Disable CSRF protection for webhook endpoints
  skip_before_action :verify_authenticity_token

  def receive
    # Log all incoming parameters
    Rails.logger.info("=== Webhook Received ===")
    Rails.logger.info("Timestamp: #{Time.current}")
    Rails.logger.info("Request Method: #{request.method}")
    Rails.logger.info("Content Type: #{request.content_type}")

    if params.present?
      Rails.logger.info("Parameters:")
      params.each do |key, value|
        Rails.logger.info("  #{key}: #{value}")
      end
    else
      Rails.logger.info("No parameters received")
    end

    # Log request body for debugging
    Rails.logger.info("Raw Body: #{request.raw_post}")

    Rails.logger.info("=== End Webhook ===")

    # Return success response
    render json: { status: 'success', message: 'Webhook received and logged' }, status: :ok
  rescue => e
    Rails.logger.error("Error processing webhook: #{e.message}")
    Rails.logger.error("Backtrace: #{e.backtrace.join("\n")}")
    render json: { status: 'error', message: 'Failed to process webhook' }, status: :internal_server_error
  end
end
