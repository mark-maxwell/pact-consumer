require 'httparty'
require_relative '../models/chocobo'

class AnimalServiceClient
  include HTTParty
  base_uri 'http://localhost:3001'

  def get_chocobo
    name = JSON.parse(self.class.get('/chocobo').body)['name']
    Chocobo.new(name)
  end
end
