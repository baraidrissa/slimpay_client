# frozen_string_literal: true

module SlimpayClient
  # Used only to get and set callback URLs.
  class App < Resource
    # Prepare an admin token for app requests.
    #
    # Arguments:
    #   username: Your SlimpayClient admin username
    #   password: Your SlimpayClient admin password
    def initialize(username = nil, password = nil)
      init_config
      @username = username || SlimpayClient.configuration.username
      @password = password || SlimpayClient.configuration.password
      @basic_auth = { username: "#{@creditor_reference}##{@username}", password: @password }
      response = HTTParty.post(@token_endpoint, basic_auth: @basic_auth, body: app_options)
      @token = response["access_token"]
    end

    # Change the successUrl
    # ===== Example:
    #   app = SlimpayClient::App.new
    #   app.success_url = "mywebsite.com/client/123/"
    def success_url(url)
      response = HTTParty.patch("#{@endpoint}/creditors/#{@creditor_reference}/apps/#{@client_id}",
                                body: { successUrl: url }.to_json, headers: options)
      SlimpayClient.answer(response)
    end

    # Change the failureUrl
    # ===== Example:
    #   app = SlimpayClient::App.new
    #   app.failure_url = "mywebsite.com/client/123/"
    def failure_url(url)
      response = HTTParty.patch("#{@endpoint}/creditors/#{@creditor_reference}/apps/#{@client_id}",
                                body: { failureUrl: url }.to_json, headers: options)
      SlimpayClient.answer(response)
    end

    # Change the cancelUrl
    # ===== Example:
    #   app = SlimpayClient::App.new
    #   app.cancel_url = "mywebsite.com/client/123/"
    def cancel_url(url)
      response = HTTParty.patch("#{@endpoint}/creditors/#{@creditor_reference}/apps/#{@client_id}",
                                body: { cancelUrl: url }.to_json, headers: options)
      SlimpayClient.answer(response)
    end

    # Change the returnUrl
    # ===== Example:
    #   app = SlimpayClient::App.new
    #   app.return_url = "mywebsite.com/client/123/"
    def return_url(url)
      response = HTTParty.patch("#{@endpoint}/creditors/#{@creditor_reference}/apps/#{@client_id}",
                                body: { returnUrl: url }.to_json, headers: options)
      SlimpayClient.answer(response)
    end

    # Change the notifyUrl
    def notify_url(url)
      response = HTTParty.patch("#{@endpoint}/creditors/#{@creditor_reference}/apps/#{@client_id}",
                                body: { notifyUrl: url }.to_json, headers: options)
      SlimpayClient.answer(response)
    end

    # Change the notification and return URLs.
    #
    # ===== Arguments:
    #   successUrl: (String) URL the customer is redirected to when leaving Slimpay platform (success).
    #   failureUrl: (String) URL the customer is redirected to when leaving Slimpay platform (failure).
    #   cancelUrl: (String) URL the customer is redirected to when leaving Slimpay platform (cancel).
    #   returnUrl: (String) URL the customer is redirected to when leaving Slimpay platform.
    #   notifyUrl: (String) URL Slimpay sends notifications to (signature, payment, etc.).
    def change_urls(urls_params)
      response = HTTParty.patch("#{@endpoint}/creditors/#{@creditor_reference}/apps/#{@client_id}",
                                body: urls_params.to_json, headers: options)
      SlimpayClient.answer(response)
    end

    private

    def app_options
      {
        "Accept" => API_HEADER,
        "Content-type" => "application/hal+json",
        "grant_type" => "client_credentials",
        "scope" => "api_admin"
      }
    end
  end
end
