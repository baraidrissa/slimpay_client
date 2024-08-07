module SlimpayClient
  # An abstract CardAlias to be inherited from.
  #
  # Defines API CardAlias non-semantic methods.
  class RecurrentDirectDebit < Resource
    def initialize
      @resource_name = self.class.to_s.demodulize.underscore.dasherize.pluralize
      super
    end

    def get_one(id = 1)
      url = "#{@endpoint}/recurrent-direct-debits/#{id}"
      response = HTTParty.get(url, headers: options)
      generate_api_methods(JSON.parse(response.body))
      SlimpayClient.answer(response)
    end

    def cancel(id = 'rec-direct-debit1')
      url = "recurrent-direct-debits/#{id}/cancellation"
      body_options = {}
      response = HTTParty.post("#{@endpoint}/#{url}", body: body_options.to_json, headers: options)
      follow_up_api(response)
    end
  end
end
