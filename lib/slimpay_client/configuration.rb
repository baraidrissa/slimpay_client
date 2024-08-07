module SlimpayClient
  class Configuration
    attr_accessor :client_id
    attr_accessor :client_secret
    attr_accessor :creditor_reference
    attr_accessor :sandbox
    attr_accessor :success_url
    attr_accessor :failure_url
    attr_accessor :cancel_url
    attr_accessor :return_url
    attr_accessor :notify_url
    attr_accessor :username
    attr_accessor :password

    def initialize
      @client_id = SlimpayClient::SANDBOX_CLIENT_ID
      @client_secret = SlimpayClient::SANDBOX_SECRET_ID
      @creditor_reference = SlimpayClient::SANDBOX_CREDITOR
      @sandbox = true
      @success_url = 'localhost:5000'
      @failure_url = 'localhost:5000'
      @cancel_url = 'localhost:5000'
      @return_url = 'localhost:5000'
      @notify_url = 'localhost:5000'
    end
  end
end
