class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_locale

  # TODO: work out a way to send the error to angular
  rescue_from ActiveRecord::RecordNotFound do |exception|
    redirect_to root_path, alert: exception.message
  end

  def current_user
    Current.user ||= Guest.new
  end
  # delegate :user, :to => :Current, :prefix => :current
  helper_method :current_user

  def current_location
    Current.location ||= Location.new
  end
  helper_method :current_location

  private
    def set_locale
      I18n.locale = params[:locale] || request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
	  logger.debug "* Locale set to '#{I18n.locale}'"
    end
end
