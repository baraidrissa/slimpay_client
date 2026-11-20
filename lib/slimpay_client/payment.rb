# frozen_string_literal: true

module SlimpayClient
  # Defines API Payment methods.
  class Payment < Resource
    def get_one(id = 1)
      url = "#{@endpoint}/payments/#{id}"
      get_resource(url)
    end

    def issues(id = 1)
      url = "#{@endpoint}/payments/#{id}/issues"
      get_resource(url)
    end

    def refund(id, amount)
      url = "payments/#{id}/refund"
      body_options = { amount: amount }
      response = HTTParty.post("#{@endpoint}/#{url}", body: body_options.to_json, headers: options)
      follow_up_api(response)
    end

    def cancel(id)
      url = "payments/#{id}/cancellation"
      body_options = {}
      response = HTTParty.post("#{@endpoint}/#{url}", body: body_options.to_json, headers: options)
      follow_up_api(response)
    end
  end
end
