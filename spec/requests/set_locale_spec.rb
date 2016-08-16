require "rails_helper"

RSpec.describe 'Set locale', type: :request do
  context 'extracting it from an HTTP header' do
    it 'for an available locale (es)' do
      get '/', headers: { 'HTTP_ACCEPT_LANGUAGE' => 'es-ES' }

      expect(I18n.locale).to eq(:es)
    end

    it 'for an available locale (en-GB)' do
      get '/', headers: { 'HTTP_ACCEPT_LANGUAGE' => 'en-GB' }

      expect(I18n.locale).to eq(:en)
    end

    it 'for an available locale (en-US)' do
      get '/', headers: { 'HTTP_ACCEPT_LANGUAGE' => 'en-US' }

      expect(I18n.locale).to eq(:en)
    end

    it 'for an non-available locale (fr), uses the default one (en)' do
      get '/', headers: { 'HTTP_ACCEPT_LANGUAGE' => 'fr' }

      expect(I18n.locale).to eq(:en)
    end
  end

  context 'using the one included in the URL' do
    it 'for an available locale (es)' do
      get '/es', headers: { 'HTTP_ACCEPT_LANGUAGE' => 'fr' }

      expect(I18n.locale).to eq(:es)
    end

    it 'for an available locale (en)' do
      get '/en', headers: { 'HTTP_ACCEPT_LANGUAGE' => 'fr' }

      expect(I18n.locale).to eq(:en)
    end

    it 'for an non-available locale (fr), raises an error' do
      expect {
        get '/fr', headers: { 'HTTP_ACCEPT_LANGUAGE' => 'fr' }
      }.to raise_error ActionController::RoutingError
    end
  end
end