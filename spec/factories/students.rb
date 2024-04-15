FactoryBot.define do
  factory :student do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    date_of_birth { Faker::Date.birthday(min_age: 15) }
    permanent_contact_number { Faker::PhoneNumber.phone_number}
    alternate_contact_number { Faker::PhoneNumber.phone_number}
    local_address { Faker::Address.full_address}
    permanent_address { Faker::Address.full_address}
  end
end
