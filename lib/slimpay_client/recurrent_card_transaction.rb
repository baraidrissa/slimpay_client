# frozen_string_literal: true

module SlimpayClient
  # Defines API RecurrentCardTransaction methods.
  class RecurrentCardTransaction < Resource
    def get_one(id = 1)
      url = "#{@endpoint}/recurrent_card_transaction/#{id}"
      get_resource(url)
    end

    def cancel(id = "card-transac-1")
      url = "recurrent-card-transactions/#{id}/cancellation"
      body_options = {}
      response = HTTParty.post("#{@endpoint}/#{url}", body: body_options.to_json, headers: options)
      follow_up_api(response)
    end
  end
end
