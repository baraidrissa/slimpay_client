module SlimpayClient
  # To display SlimpayClient error messages with the HTTP code.
  #
  # ==== Possible API errors
  # * code: 906 message: "Error : Could not find acceptable representation"
  # * code: 906 message: "Error : Request method 'POST' not supported"
  # * code: 906 message: "Error : Content type 'application/x-www-form-urlencoded' not supported"
  # * code: 904 message: "Access denied : cannot access creditor democreditor"
  # * error:"invalid_token", error_description: "Invalid access token: 1234-123456-abcdef-123456"
  # * code: 205, message: "Client data are inconsistent : missing query parameters creditorReference and/or rum"
  class Error < StandardError
    attr_reader :message
    # If the HTTP response is nil or empty returns an actual message.
    def self.empty
      @message = {code: 418, message: 'The answer was empty.'}
    end

    # Returns either formated error with its HTTP code or the raw HTTP response.
    # ===== Arguments:
    #   http_response: (HTTParty::Response)
    def initialize(http_response)
      if defined?(http_response.code)
        display_http_error(http_response)
      else
        @message = JSON.parse(http_response.body)
      end
      fail self, @message.to_s
    end

    def to_s
      @message
    end

    private

    def display_http_error(http_response)
      @message = case http_response.code
                 when 400
                   bad_request(http_response)
                 when 401
                   unauthorized(http_response)
                 when 403
                   forbidden(http_response)
                 when 404
                   not_found
                 when 406
                   not_acceptable(http_response)
                 else
                   http_response
                 end
    end

    def bad_request(http_message)
      {code: 400, message: "HTTP Bad Request. #{slimpay_error(http_message)}"}
    end

    def unauthorized(http_message)
      {code: 401, message: "HTTP Unauthorized. #{slimpay_error(http_message)}"}
    end

    def forbidden(http_message)
      {code: 403, message: "HTTP Forbidden. #{slimpay_error(http_message)}"}
    end

    def not_found
      {code: 404, message: 'URI not found.'}
    end

    def not_acceptable(http_message)
      {code: 406, message: "HTTP Not Acceptable. #{slimpay_error(http_message)}"}
    end

    def slimpay_error(http_message)
      slimpay_error = http_message.is_a?(Hash) ? http_message : JSON.parse(http_message.body)
      slimpay_code = slimpay_error['code']
      slimpay_message = slimpay_error['message'] || slimpay_error['error_description']
      "SlimpayClient #{slimpay_code} : #{slimpay_message}"
    end
  end
end
