module SlimpayClient
  # An abstract resource to be inherited from.
  #
  # Defines API resource non-semantic methods.
  class Resource < Base
    def initialize
      @resource_name = self.class.to_s.demodulize.underscore.dasherize.pluralize
      super
    end

    # Shortcut method to get a resource with only resource's reference.
    #
    # The above example shall return the same result as
    #   mandates = SlimpayClient::Mandate.new
    #   mandates.get_mandates({creditorReference: @creditor_reference, reference: 1})
    #
    # ===== Example:
    #   mandates = SlimpayClient::Mandate.new
    #   mandates.get_one(1)
    # ===== Arguments:
    #   reference: (String)
    def get_one(reference = 1)
      url = "#{@endpoint}/creditors/#{@creditor_reference}/#{@resource_name}/#{reference}"
      response = HTTParty.get(url, headers: options)
      generate_api_methods(JSON.parse(response.body))
      SlimpayClient.answer(response)
    end
  end
end
