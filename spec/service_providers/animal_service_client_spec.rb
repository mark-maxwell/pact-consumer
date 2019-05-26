require_relative '../../app/models/chocobo'
require_relative '../../app/services/animal_service_client'
require_relative 'pact_helper'

describe AnimalServiceClient, pact: true do
  before do
    AnimalServiceClient.base_uri 'localhost:1234'
  end

  subject { AnimalServiceClient.new }

  describe 'get_chocobo' do
    before do
      animal_service.given('a chocobo exists').
        upon_receiving('a request for a chocobo').
        with(method: :get, path: '/chocobo', query: '').
        will_respond_with(
          status: 200,
          headers: { 'Content-Type' => 'application/json' },
          body: { name: 'Sally' }
        )
    end

    it 'returns a chocobo' do
      expect(subject.get_chocobo).to eq(Chocobo.new('Sally'))
    end
  end
end
