# frozen_string_literal: true

require_relative "slimpay_client/version"
require 'oauth2'
require 'httparty'

require 'active_support/core_ext/string/inflections'

require 'slimpay_client/configuration'
require 'slimpay_client/error'
require 'slimpay_client/base'
require 'slimpay_client/resource'
require 'slimpay_client/app'
require 'slimpay_client/mandate'
require 'slimpay_client/order'
require 'slimpay_client/direct_debit'
require 'slimpay_client/creditor'
require 'slimpay_client/card_alias'
require 'slimpay_client/card'
require 'slimpay_client/recurrent_card_transaction'
require 'slimpay_client/recurrent_direct_debit'
require 'slimpay_client/payment'

# SlimpayClient module defines Simpay's HAPI constants and require dependencies.
# TODO: If-None-Match support. (next answer ?= 304)
# TODO: wiki/doc full worflow: 1. App to change URls, 2. Order to sign mandate, 3. DirectDebit to pay with mandate.
module SlimpayClient
  PRODUCTION_ENDPOINT = 'https://api.slimpay.net'.freeze
  SANDBOX_ENDPOINT = 'https://api.preprod.slimpay.com'.freeze
  SANDBOX_CLIENT_ID = 'democreditor01'.freeze
  SANDBOX_SECRET_ID = 'demosecret01'.freeze
  SANDBOX_CREDITOR = 'democreditor'.freeze

  class << self
    attr_accessor :configuration
  end

  # Sets the initial configuration for client_id, client_secret and creditor_reference
  # ===== Usage:
  #   SlimpayClient.configure do |config|
  #     config.client_id = "your_client_id"
  #     config.client_secret = "your_client_secret"
  #     config.creditor_reference = "your_creditor_reference"
  #     config.sandbox = true
  #     config.notify_url = 'you_notifications_url'
  #     config.success_url = 'your_success_url'
  #     config.failure_url = 'your_failure_url'
  #     config.cancel_url = 'your_cancel_url'
  #     config.return_url = 'your_return_url'
  #   end
  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  # Used to display HTTP requests responses nicely in case of error.
  #
  # ===== Arguments:
  #   http_response: (HTTParty::Response)
  def self.answer(http_response)
    # return SlimpayClient::Error.empty if http_response.try(:body).nil?
    return SlimpayClient::Error.empty if ( http_response.blank? || http_response.body.blank? )

    if http_response.code >= 400
      SlimpayClient::Error.new(http_response)
    else
      http_response.body
    end
  end
end
