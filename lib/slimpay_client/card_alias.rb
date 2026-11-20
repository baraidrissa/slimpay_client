# frozen_string_literal: true

module SlimpayClient
  # Defines API CardAlias methods.
  class CardAlias < Resource
    def get_one(id = 1)
      url = "#{@endpoint}/card_aliases/#{id}"
      get_resource(url)
    end
  end
end
