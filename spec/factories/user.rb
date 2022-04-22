FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    username { Faker::Internet.username }
    role { "user" }
  end

  factory :vendor, class: User do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    username { Faker::Internet.username }
    role { "vendor" }
  end

  #trait :vendor do
  # role { vendor }
  #end
  Arrange 、 Act 、 Assert
end