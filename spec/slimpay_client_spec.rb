# frozen_string_literal: true

RSpec.describe SlimpayClient do
  it "has a version number" do
    expect(SlimpayClient::VERSION).not_to be nil
  end

  it 'answers to nil HTTP responses' do
    expect(SlimpayClient.answer(nil)).not_to be nil
  end

  it 'defines API constants' do
    expect(SlimpayClient::PRODUCTION_ENDPOINT).not_to be nil
    expect(SlimpayClient::PRODUCTION_ENDPOINT).to eq 'https://api.slimpay.net'
    expect(SlimpayClient::SANDBOX_ENDPOINT).not_to be nil
    expect(SlimpayClient::SANDBOX_ENDPOINT).to eq 'https://api.preprod.slimpay.com'
  end

  describe '.configure' do
    before do
      SlimpayClient.configure do |config|
        config.client_id = 'testcreditor01'
        config.client_secret = 'testsecret01'
        config.creditor_reference = 'testcreditor'
        config.success_url = 'localhost:3000'
        config.failure_url = 'localhost:3000'
        config.cancel_url = 'localhost:3000'
        config.return_url = 'localhost:3000'
        config.notify_url = 'localhost:3000'
        config.username = 'admin@test.com'
        config.password = '123456'
      end
    end

    it 'initializes the variables with given config' do
      expect(SlimpayClient.configuration.client_id).to eq('testcreditor01')
      expect(SlimpayClient.configuration.client_secret).to eq('testsecret01')
      expect(SlimpayClient.configuration.creditor_reference).to eq('testcreditor')
      expect(SlimpayClient.configuration.return_url).to eq('localhost:3000')
      expect(SlimpayClient.configuration.notify_url).to eq('localhost:3000')
      expect(SlimpayClient.configuration.username).to eq('admin@test.com')
      expect(SlimpayClient.configuration.password).to eq('123456')
    end
  end

end
