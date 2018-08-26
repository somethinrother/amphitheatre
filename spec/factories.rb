FactoryBot.define do
  factory :user do
    username { 'bobo' }
    email { 'bobo@gmail.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end

  factory :campaign do
    user
    title { 'Wheel of Time' }
    description { 'Awesome series' }
  end

  factory :setting_detail do
    campaign
    title { 'Year' }
    description { '239' }
  end

  factory :chapter do
    campaign
    title { 'The Eye of the World' }
    description { 'Sweet book' }
  end
end
