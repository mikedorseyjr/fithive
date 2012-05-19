# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :workout do
    name "MyString"
    activity_id 1
    user_id 1
    trainer false
  end
end
