FactoryBot.define do
  factory :event do
    venue
    meetup_id { SecureRandom.hex(32) }
    meetup_link { Faker::Internet.url("meetup.com") }
    name { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
    start_time { Time.now.utc - 6.hours }
    end_time { Time.now.utc - 4.hours }
    num_attendees { 5 }
  end
end
