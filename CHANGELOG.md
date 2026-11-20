## [Unreleased]

* fix `SlimpayClient::App`: missing `API_HEADER` constant raised `NameError`
* fix query string building for generated GET methods (trailing `&`, nil arguments, URL encoding)
* fix `get_one`: API errors are raised before parsing the response body
* require `json` and `uri` explicitly
* remove duplicated `initialize` in resources, fix doc comments
* rubocop autocorrect
* gemspec: `required_ruby_version >= 3.2`, `activesupport >= 7.0, < 9`, `httparty >= 0.24.3`, `oauth2 >= 2.0.12`, updated dev dependencies
* CI on Ruby 3.4

## [1.1.3] - 2026-03-31
* update gem dependency
** 'httparty', '~> 0.24.2'

## [1.1.0] - 2025-07-15

* release task

## [1.0.1] - 2025-07-15

* update gem dependency
** 'httparty', '~> 0.23.1'

## [1.0.0] - 2024-08-27

* Specs

## [0.1.3] - 2024-08-07

* README

## [0.1.2] - 2024-08-07

* README

## [0.1.1] - 2024-08-07

* Changelog file
* fixes

## [0.1.0] - 2024-08-07

- Initial release
