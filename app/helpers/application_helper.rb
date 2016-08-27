module ApplicationHelper
  # Checks if given locale is currently being used
  #
  # @param [Symbol|String] lang - locale
  #
  # @return [Boolean] true if locale is being used or false otherwise
  def current_locale?(lang)
    I18n.locale == lang.to_sym
  end
end
