# Test Pact consumer
A simple pact consumer app that publishes pacts to a [pact broker](https://github.com/mark-maxwell/pact-broker).
A [test pact provider Rails app](https://github.com/mark-maxwell/pact-provider)
sits at the other side of the pact broker to verify the published pacts.

Used as a little trial before using pact in a large scale project to ensure
setup and configuration is simple, and that the 3 elements (consumer, broker,
provider) are decoupled from one another.

NOTE: Log files have been commited purely for test purposes.

## Pact process explained from POV of the consumer
1. Expected behaviour from provider described e.g.
   `spec/service_providers/animal_service_client_spec.rb`

2. `bundle exec rspec` -> generates a pact file in: `spec/pacts/chocobo_app-animal_service.json`
   where filename comes from setup in: `spec/service_providers/pact_helper.rb`
   which describes name of consumer (this) app and the name of a provider app
   for a pact.

3. Pact file is referenced in **provider** project: `spec/service_consumers/pact_helper.rb`
   ```ruby
   honours_pact_with 'Chocobo app' do
     pact_uri '../pact_consumer/spec/pacts/chocobo_app-animal_service.json'
   end
   ```
4. In **provider** project: `bundle exec rake pact:verify` will verify that it
   honours the pact located in this consumer.

## Pact process w/ a pact broker

Writing and generating pacts remains the same, however publishing to a pact
broker requires the following setup:

1. Add `pact_broker-client` to Gemfile.
2. Create a Rakefile containing publication configuration, such as the pact
   broker URL.
3. Publish the pacts: `bundle exec rake pact:publish`
