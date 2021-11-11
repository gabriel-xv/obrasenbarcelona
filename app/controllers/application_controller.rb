class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  rescue_from ActiveRecord::RecordNotFound do
    not_found
  end

  rescue_from ActionController::RoutingError do
    not_found
  end

  rescue_from ActionController::StandardError do
    internal_server_error
  end
end
