require 'spec_helper'

RSpec.describe SlimpayClient::Error do
  it 'returns an explanation for empty HTTP responses' do
    expect(SlimpayClient::Error.empty).to eq(code: 418, message: 'The answer was empty.')
  end
end
