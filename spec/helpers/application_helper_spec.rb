require "rails_helper"

RSpec.describe ApplicationHelper, type: :helper do
  describe 'current_locale?(lang)' do
    before do
      @original_locale = I18n.locale
      I18n.locale = :en
    end

    after do
      I18n.locale = @original_locale
    end

    it 'is true when matches with given locale (as symbol)' do
      expect(helper.current_locale?(:en)).to be_truthy
    end

    it 'is true when matches with given locale (as string)' do
      expect(helper.current_locale?('en')).to be_truthy
    end

    it 'is false when does not match with given locale' do
      expect(helper.current_locale?(:es)).to be_falsey
    end
  end

  describe 'meta_tags_alternate_config' do
    before do
      @available_locales = I18n.available_locales
      I18n.available_locales = [:en, :es]
    end

    after do
      I18n.available_locales = @available_locales
    end

    it 'returns multilingual links for search engines' do
      expect(helper.meta_tags_alternate_config).to eq({
        en: root_url(locale: :en),
        es: root_url(locale: :es)
      })
    end
  end

  describe 'meta_tags_icon_config' do
    it 'returns favicons for search engines' do
      expect(helper.meta_tags_icon_config).to eq([
        { href: '/favicon-16x16.png', sizes: '16x16', type: 'image/png' },
        { href: '/favicon-32x32.png', sizes: '32x32', type: 'image/png' },
        { href: '/apple-touch-icon-144x144.png', rel: 'apple-touch-icon-precomposed', sizes: '144x144', type: 'image/png' },
        { href: '/apple-touch-icon-152x152.png', rel: 'apple-touch-icon-precomposed', sizes: '152x152', type: 'image/png' }
      ])
    end
  end
end
