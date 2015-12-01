# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name {Faker::Name.name}
    email "MyString"
    password "1"
    role "MyString"
    active false
    status "MyString"
  end
end
