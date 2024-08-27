require 'spec_helper'

RSpec.describe SlimpayClient::Configuration do
  describe 'credentials' do
    it 'defaults are sandbox' do
      expect(subject.client_id).to eql(SlimpayClient::SANDBOX_CLIENT_ID)
      expect(subject.client_secret).to eql(SlimpayClient::SANDBOX_SECRET_ID)
      expect(subject.creditor_reference).to eql(SlimpayClient::SANDBOX_CREDITOR)
    end
  end

  describe 'client_id=' do
    it 'can set value' do
      subject.client_id = 'testconfigidaccessor'
      expect(subject.client_id).to eq('testconfigidaccessor')
    end
  end

  describe 'username=' do
    it 'can set value' do
      subject.username = 'admin@test.com'
      expect(subject.username).to eq('admin@test.com')
    end
  end
end
