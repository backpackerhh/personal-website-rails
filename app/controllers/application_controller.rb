class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  # Sets the locale at the beginning of each request so that all strings are translated using
  # the desired locale during the lifetime of that request.
  def set_locale
    I18n.locale = if I18n.available_locales.include?(locale_from_params_or_header)
                    locale_from_params_or_header
                  else
                    I18n.default_locale
                  end
  end

  # Includes an explicit locale in every URL
  #
  # @return [Hash<Symbol>] locale included in every URL
  def default_url_options
    { locale: I18n.locale }
  end

  private

  # When an explicit locale has not been set for a request, it's extracted from the header value
  # based on the user's language preference settings that browsers set
  #
  # @return [Symbol] locale extracted from URL params or HTTP header
  def locale_from_params_or_header
    (params[:locale] || request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first).to_sym
  end
end
