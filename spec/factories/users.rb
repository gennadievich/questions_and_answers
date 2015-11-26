# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "MyString"
    email "MyString"
    password ""
    role "MyString"
    active false
    status "MyString"
  end
end
