# SlimpayClient

Welcome to your new gem!

SlimpayClient is a Ruby gem designed to provide a comprehensive and up-to-date interface for interacting with the Slimpay API. This gem extends the original \`slimpay\` gem created by gdurelle, addressing the need for maintenance and updates to ensure compatibility with the latest Slimpay API features and best practices.

## Features

- Seamless integration with the Slimpay API
- Support for the latest API endpoints and features
- Improved error handling and logging
- Easy configuration and setup

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'slimpay_client'
```

And then execute:

```ruby
$ bundle
```

Or install it yourself as:

```ruby
$ gem install slimpay_client
```

## Usage

**API Docs: [https://dev.slimpay.com/](https://dev.slimpay.com/)**

### Configuration

If you use _Rails_ place this code in _config/initializers/slimpay_client.rb_:

```ruby
SlimpayClient.configure do |config|
  config.client_id = "your_client_id"
  config.client_secret = "your_client_secret"
  config.creditor_reference = "your_creditor_reference"
  config.sandbox = true
  config.notify_url = 'you_notifications_url'
  config.success_url = 'your_success_url'
  config.failure_url = 'your_failure_url'
  config.cancel_url = 'your_cancel_url'
  # or
  config.return_url = 'your_return_url'
end
```

### Notification and return URLs

The notification URL is the point of your application where Slimpay will send a POST request with the result of the current order.
The state of the order will be either **close.completed** or **closed.aborted.aborted_byclient** if everything worked normally, or one of those quoted in the ([API Order documentation](https://dev.slimpay.com/hapi/reference/orders)).

The return URL is the point of your application where your user/customer will be redirected to when he will have finish signing its mandate with Slimpay.

### The root endpoint:

The Slimpay API uses self-discovery. It means that each time you will perform a request, the answer will be a Hash of links to follow in order to perform more requestq.

The more you do requests, the more methods will appear.

When you emplement any class, it will inherits from the root-endpoint and thus already have available methods.

```ruby
slimpay = Slimpay::Base.new(client_id = '1234', client_secret = '987654321', creditor_reference = 'azerty')
slimpay.api_methods
```

⚠️ If you call ``Slimpay::Base.new`` without arguments, the _Sandbox_ credentials will be used.

Result will be a Hash:

```ruby
{"self"=>"https://api.preprod.slimpay.com/",
   "profile"=>"https://api.preprod.slimpay.com/alps/v1",
   "post_token"=>"https://api.preprod.slimpay.com/oauth/token",
   "create_orders"=>"https://api.preprod.slimpay.com/orders",
   "get_orders"=>"https://api.preprod.slimpay.com/orders{?creditorReference,reference}",
   "search_order_by_id"=>"https://api.preprod.slimpay.com/orders/{id}",
   "search_orders"=>"https://api.preprod.slimpay.com/orders{?id,creditorReference,entityReference,subscriberReference,reference,state,type,dateCreatedBefore,dateCreatedAfter,embed,withPageMetadata,page,size}",
   "get_creditors"=>"https://api.preprod.slimpay.com/creditors{?reference}",
   "create_mandates"=>"https://api.preprod.slimpay.com/mandates",
   "get_mandates"=>"https://api.preprod.slimpay.com/mandates{?creditorReference,reference,rum,id,paymentScheme}",
   "search_mandates"=>"https://api.preprod.slimpay.com/mandates{?creditorReference,entityReference,subscriberReference,mandateReference,paymentScheme,creationChannel,dateSignedBefore,dateSignedAfter,state,iban,signatoryLastName,signatoryEmail,companyName,embed,withPageMetadata,page,size}",
   "create_documents"=>"https://api.preprod.slimpay.com/documents",
   "get_documents"=>"https://api.preprod.slimpay.com/documents{?creditorReference,entityReference,reference}",
   "search_document_by_id"=>"https://api.preprod.slimpay.com/documents/{id}",
   "search_documents"=>"https://api.preprod.slimpay.com/documents/search{?creditorReference,status,creationDateBefore,creationDateAfter,documentReference,publicReference,subscriberReference,signatoryLastName,signatoryEmail,withPageMetadata,page,size}",
   "create_payins"=>"https://api.preprod.slimpay.com/payments/in",
   "create_payouts"=>"https://api.preprod.slimpay.com/payments/out",
   "search_payments"=>"https://api.preprod.slimpay.com/payments{?creditorReference,entityReference,subscriberReference,mandateReference,cardAliasReference,scheme,direction,reference,category,currency,state,executionStatus,processor,executionDateBefore,executionDateAfter,embed,withPageMetadata,page,size}",
   "search_payment_by_id"=>"https://api.preprod.slimpay.com/payments/{id}",
   "search_payment_issues"=>"https://api.preprod.slimpay.com/payment-issues{?creditorReference,entityReference,subscriberReference,scheme,currency,executionStatus,dateCreatedBefore,dateCreatedAfter,withPageMetadata,page,size}",
   "search_payment_issue_by_id"=>"https://api.preprod.slimpay.com/payment-issues/{id}",
   "create_direct_debits"=>"https://api.preprod.slimpay.com/direct-debits",
   "get_direct_debits"=>"https://api.preprod.slimpay.com/direct-debits{?id}",
   "search_direct_debits"=>"https://api.preprod.slimpay.com/direct-debits{?creditorReference,entityReference,subscriberReference,mandateReference,paymentReference,currency,executionDateBefore,executionDateAfter,withPageMetadata,page,size}",
   "search_direct_debit_issues"=>"https://api.preprod.slimpay.com/direct-debit-issues{?creditorReference,entityReference,subscriberReference,currency,executionStatus,dateCreatedBefore,dateCreatedAfter,withPageMetadata,page,size}",
   "get_direct_debit_issues"=>"https://api.preprod.slimpay.com/direct-debit-issues{?id}",
   "create_recurrent_direct_debits"=>"https://api.preprod.slimpay.com/recurrent-direct-debits",
   "get_recurrent_direct_debits"=>"https://api.preprod.slimpay.com/recurrent-direct-debits{?id}",
   "search_recurrent_direct_debits"=>"https://api.preprod.slimpay.com/recurrent-direct-debits{?creditorReference,entityReference,subscriberReference,reference,currency,activated,frequency,dateFromBefore,dateFromAfter,withPageMetadata,page,size}",
   "create_credit_transfers"=>"https://api.preprod.slimpay.com/credit-transfers",
   "get_credit_transfers"=>"https://api.preprod.slimpay.com/credit-transfers{?id}",
   "search_credit_transfers"=>"https://api.preprod.slimpay.com/credit-transfers{?creditorReference,entityReference,subscriberReference,mandateReference,paymentReference,currency,executionDateBefore,executionDateAfter,page,size}",
   "get_card_aliases"=>"https://api.preprod.slimpay.com/card-aliases{?id}",
   "search_card_aliases"=>"https://api.preprod.slimpay.com/card-aliases{?creditorReference,entityReference,subscriberReference,reference,status,withPageMetadata,page,size}",
   "search_card_by_id"=>"https://api.preprod.slimpay.com/cards/{id}",
   "get_recurrent_card_transactions"=>"https://api.preprod.slimpay.com/recurrent-card-transactions{?id}",
   "search_recurrent_card_transactions"=>"https://api.preprod.slimpay.com/recurrent-card-transactions{?creditorReference,entityReference,subscriberReference,reference,currency,activated,frequency,dateFromBefore,dateFromAfter,page,size}",
   "create_recurrent_card_transactions"=>"https://api.preprod.slimpay.com/recurrent-card-transactions",
   "get_card_transaction_issues"=>"https://api.preprod.slimpay.com/card-transaction-issues{?id}",
   "search_bank_account_by_id"=>"https://api.preprod.slimpay.com/bank-accounts{?id}",
   "search_balances"=>"https://api.preprod.slimpay.com/balances{?creditorReference,entityReference,currency,lastCalculated,page,size}",
   "search_order_item_by_id"=>"https://api.preprod.slimpay.com/order-items/{id}",
   "search_subscribers"=>"https://api.preprod.slimpay.com/subscribers{?creditorReference,entityReference,reference,withPageMetadata,page,size}",
   "search_report"=>"https://api.preprod.slimpay.com/reports{?creditorReference,entityReference,dateFrom,dateTo}",
   "search_document_templates"=>"https://api.preprod.slimpay.com/document-templates{?creditorReference,page,size}",
   "create_document_template"=>"https://api.preprod.slimpay.com/document-templates",
   "search_document_template_by_id"=>"https://api.preprod.slimpay.com/document-templates/{id}",
   "search_mandate_templates"=>"https://api.preprod.slimpay.com/mandate-templates{?creditorReference,page,size}",
   "create_mandate_template"=>"https://api.preprod.slimpay.com/mandate-templates",
   "search_mandate_template_by_id"=>"https://api.preprod.slimpay.com/mandate-templates/{id}",
   "search_files"=>"https://api.preprod.slimpay.com/files{?creditorReference,name,creationDateBefore,creationDateAfter,flow,category,status,state,withPageMetadata,page,size}",
   "search_file_by_id"=>"https://api.preprod.slimpay.com/files/{id}",
   "create_file"=>"https://api.preprod.slimpay.com/files{?creditorReference}",
   "create_webhook"=>"https://api.preprod.slimpay.com/v1/webhook-configurations",
   "get_webhook"=>"https://api.preprod.slimpay.com/v1/webhook-configurations/{id}",
   "get_webhooks"=>"https://api.preprod.slimpay.com/v1/webhook-configurations{?creditorReference}"}
```

The keys of this Hash are the methods name you can call on the class instance (here Slimpay::Base).
The value is the URL that will be used, with its arguments.

**Example:**

```ruby
"get_orders"=>"https://api.preprod.slimpay.com/orders{?creditorReference,reference}",
```

The arguments will be _creditorReference_ and _reference_. You can give them as a Hash.
See below for an example.

Some methods as been added to this gem as shortcuts to these root methods.

### Available resources :

**Order**, **Mandate**, **App**

Each resource inherit from _Resource_ wich itself inherits from _Base_.
_Base_ defines root methods according to the Slimpay API.

**Example:**

The official API method:

```ruby
orders = Slimpay::Order.new(client_id = '1234', client_secret = '987654321', creditor_reference = 'azerty')
orders.get_orders({creditorReference: 'mysellername', reference: 1234})
```

The shortcut:

```ruby
orders = Slimpay::Order.new(client_id = '1234', client_secret = '987654321', creditor_reference = 'azerty')
orders.get_one(1234)
```

Result will be a Hash:

```json
{"_links"=>
  {"self"=>{"href"=>"https://api.preprod.slimpay.com/creditors/democreditor/orders/1"},
   "https://api.slimpay.net/alps#get-creditor"=>{"href"=>"https://api.preprod.slimpay.com/creditors/democreditor"},
   "https://api.slimpay.net/alps#get-subscriber"=>{"href"=>"https://api.preprod.slimpay.com/creditors/democreditor/orders/1/subscribers/subscriber01"},
   "https://api.slimpay.net/alps#user-approval"=>{"href"=>"https://slimpay.net/slimpaytpe16/userApproval?accessCode=spK534N0cuZztBGwj2FjC6eKzcsKFRzXbfy8buloUHiZV6p9PhIfcPgV7c507R"},
   "https://api.slimpay.net/alps#get-order-items"=>{"href"=>"https://api.preprod.slimpay.com/creditors/democreditor/orders/1/items"},
   "https://api.slimpay.net/alps#get-mandate"=>{"href"=>"https://api.preprod.slimpay.com/creditors/democreditor/mandates/1"}},
 "reference"=>"1",
 "state"=>"closed.completed",
 "started"=>true,
 "dateCreated"=>"2014-12-12T09:35:39.000+0000",
 "mandateReused"=>false}
```

Now you can call new methods : get_creditor, get_subscriber, user_approval, get_order_items, get_mandate

**NB:** Note that the methods in the resulting Hash are dashed-named, but the generated methods are camelcased.

## Credentials

The sanbox let you test credentials connection and few methods.

You will need a test environment setted up by Slimpay to go further.

### SANDBOX

* client_id =  'democreditor01'
* client_secret = 'demosecret01'
* creditor_reference : democreditor

### Test

* IBAN : FR1420041010050500013M02606
* BIC : PSSTFRPP
* Code for phone verification : 0000

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/slimpay_client. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/slimpay_client/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SlimpayClient project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/slimpay_client/blob/master/CODE_OF_CONDUCT.md).
