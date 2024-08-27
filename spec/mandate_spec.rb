require 'spec_helper'

RSpec.describe SlimpayClient::Mandate do
  include_examples 'Expect OAuth and first requests', SlimpayClient::Mandate

  subject {SlimpayClient::Mandate}

  it 'is a Resource child' do
    allow_oauth_and_first_requests(SlimpayClient::Mandate)
    expect(subject.new).to be_a SlimpayClient::Resource
    expect(subject.new).to be_an_instance_of SlimpayClient::Mandate
  end

  it 'has a get_one method' do
    allow_oauth_and_first_requests(SlimpayClient::Mandate)
    expect(subject.new).to respond_to :get_one
  end
end
