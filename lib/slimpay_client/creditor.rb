# frozen_string_literal: true

module SlimpayClient
  # Defines API Creditor methods.
  class Creditor < Resource
    def get_one(reference = 1)
      url = "#{@endpoint}/creditors/#{reference}"
      get_resource(url)
    end
  end
end
