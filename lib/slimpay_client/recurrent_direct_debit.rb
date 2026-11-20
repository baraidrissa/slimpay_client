# frozen_string_literal: true

module SlimpayClient
  # Defines API RecurrentDirectDebit methods.
  class RecurrentDirectDebit < Resource
    def get_one(id = 1)
      url = "#{@endpoint}/recurrent-direct-debits/#{id}"
      get_resource(url)
    end

    def cancel(id = "rec-direct-debit1")
      url = "recurrent-direct-debits/#{id}/cancellation"
      body_options = {}
      response = HTTParty.post("#{@endpoint}/#{url}", body: body_options.to_json, headers: options)
      follow_up_api(response)
    end
  end
end
