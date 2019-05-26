# Pact process explained from POV of the consumer
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
