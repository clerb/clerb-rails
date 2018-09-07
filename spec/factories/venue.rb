FactoryBot.define do
  factory :venue do
    meetup_id { SecureRandom.hex(32) }
    name { Faker::Lorem.word }
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
  end
end
