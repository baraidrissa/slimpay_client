# frozen_string_literal: true

module SlimpayClient
  # Defines API Card methods.
  class Card < Resource
    def get_one(id = 1)
      url = "#{@endpoint}/cards/#{id}"
      get_resource(url)
    end
  end
end
