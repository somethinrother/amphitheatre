FactoryBot.define do
  # SEQUENCES
  sequence :username do |n|
    "person#{n}"
  end

  sequence :email do |n|
    "person#{n}@example.com"
  end

  sequence :title do |n|
    "title#{n}"
  end

  sequence :description do |n|
    "I have provided #{n} descriptions"
  end

  sequence :number do |n|
    n
  end

  sequence :id_array do |n|
    ["#{n}", "#{n+1}", "#{n+2}"]
  end

  # MODELS

  factory :campaign do
    user
    title
    description
  end

  factory :chapter do
    campaign
    title
    description
  end

  factory :location do
    campaign
    name { generate(:title) }
    description { generate(:description) }
  end

  factory :player do
    campaign
    user
    role { ['GM', 'PC'] }
  end

  factory :user do
    username
    email
    password { 'password' }
    password_confirmation { 'password' }
  end
end
