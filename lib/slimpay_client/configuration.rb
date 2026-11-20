# frozen_string_literal: true

module SlimpayClient
  # Holds credentials, environment and callback URLs. See SlimpayClient.configure.
  class Configuration
    attr_accessor :client_id, :client_secret, :creditor_reference, :sandbox, :success_url, :failure_url, :cancel_url,
                  :return_url, :notify_url, :username, :password

    def initialize
      @client_id = SlimpayClient::SANDBOX_CLIENT_ID
      @client_secret = SlimpayClient::SANDBOX_SECRET_ID
      @creditor_reference = SlimpayClient::SANDBOX_CREDITOR
      @sandbox = true
      @success_url = "localhost:5000"
      @failure_url = "localhost:5000"
      @cancel_url = "localhost:5000"
      @return_url = "localhost:5000"
      @notify_url = "localhost:5000"
    end
  end
end
