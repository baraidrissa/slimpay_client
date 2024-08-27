require 'spec_helper'

RSpec.describe SlimpayClient::DirectDebit do
  include_examples 'Expect OAuth and first requests', SlimpayClient::Base

  it 'is a Resource child' do
    allow_oauth_and_first_requests(SlimpayClient::DirectDebit)
    expect(SlimpayClient::DirectDebit.new).to be_a SlimpayClient::Resource
    expect(SlimpayClient::DirectDebit.new).to be_an_instance_of SlimpayClient::DirectDebit
  end

  it 'has a get_one method' do
    allow_oauth_and_first_requests(SlimpayClient::DirectDebit)
    expect(SlimpayClient::DirectDebit.new).to respond_to :get_one
  end

  it 'has its POST methods shortcuts' do
    allow_oauth_and_first_requests(SlimpayClient::DirectDebit)
    expect(SlimpayClient::DirectDebit.new).to respond_to :make_payment
  end
end
