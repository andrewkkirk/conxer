require 'factory_girl'

FactoryGirl.define do
  sequence :email do |n|
    "foo.bar#{n}@example.com"
  end

FactoryGirl.define do
  factory :user, aliases: [:connectee1, :connectee2, :connector] do
    name "John"
    email
  end
end

  factory :connection do
    connectee1
    connectee2
    connector
    reason "reason"
  end
end
