require 'pact_broker/client/tasks'

PactBroker::Client::PublicationTask.new do | task |
  task.consumer_version = 1
  #task.pattern = 'custom/path/to/pacts/*.json' # optional, default value is 'spec/pacts/*.json'
  task.pact_broker_base_url = "http://localhost:9292"
  task.tag_with_git_branch = true|false # Optional but STRONGLY RECOMMENDED as it will greatly assist with your pact workflow. Result will be merged with other specified task.tags
  task.tags = ["dev"] # optional
  #task.pact_broker_basic_auth =  { username: 'basic_auth_user', password: 'basic_auth_pass'} # optional
  task.pact_broker_token = "1234abcd" # Bearer token
  #task.write_method = :merge # optional, this will merge the published pact into an existing pact rather than overwriting it if one exists. Not recommended, as it makes a mulch of the workflow on the broker.
end
