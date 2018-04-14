module ApplicationHelper
  # Checks if given locale is currently being used
  #
  # @param [Symbol|String] lang - locale
  #
  # @return [Boolean] true if locale is being used or false otherwise
  def current_locale?(lang)
    I18n.locale == lang.to_sym
  end

  # Builds multilingual links for search engines
  #
  # @return [Hash] multilingual links for search engines
  def meta_tags_alternate_config
    I18n.available_locales.each_with_object({}) do |locale, memo|
      memo[locale] = root_url(locale: locale)
    end
  end

  # Builds favicons for search engines
  #
  # Assets pipeline is skipped, so images are in public folder
  #
  # @return [Array<Hash>] favicons for search engines
  def meta_tags_icon_config
    [
      {
        href: asset_path('favicon-16x16.png', skip_pipeline: true),
        sizes: '16x16',
        type: 'image/png'
      },
      {
        href: asset_path('favicon-32x32.png', skip_pipeline: true),
        sizes: '32x32',
        type: 'image/png'
      },
      {
        href: asset_path('apple-touch-icon-144x144.png', skip_pipeline: true),
        rel: 'apple-touch-icon-precomposed',
        sizes: '144x144',
        type: 'image/png'
      },
      {
        href: asset_path('apple-touch-icon-152x152.png', skip_pipeline: true),
        rel: 'apple-touch-icon-precomposed',
        sizes: '152x152',
        type: 'image/png'
      }
    ]
  end
end
