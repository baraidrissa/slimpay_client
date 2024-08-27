require 'spec_helper'

RSpec.describe SlimpayClient::Creditor do
  include_examples 'Expect OAuth and first requests', SlimpayClient::Base

  it 'is a Resource child' do
    allow_oauth_and_first_requests(SlimpayClient::Creditor)
    expect(SlimpayClient::Creditor.new).to be_a SlimpayClient::Resource
    expect(SlimpayClient::Creditor.new).to be_an_instance_of SlimpayClient::Creditor
  end

  it 'has a get_one method' do
    allow_oauth_and_first_requests(SlimpayClient::Creditor)
    expect(SlimpayClient::Creditor.new).to respond_to :get_one
  end

end
