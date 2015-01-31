FactoryGirl.define do
  factory :user, class: User do
    name "John Doe"
    email "john@doe.com"
    city "Los Angeles"
    password "awesome"
  end
end