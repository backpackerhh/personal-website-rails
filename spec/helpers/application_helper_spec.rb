require "rails_helper"

RSpec.describe ApplicationHelper, type: :helper do
  describe 'current_locale?(lang)' do
    before do
      @orig_locale = I18n.locale
      I18n.locale = :en
    end

    after do
      I18n.locale = @orig_locale
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
end
