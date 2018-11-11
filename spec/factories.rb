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

  # MODELS
  factory :blue_book do
    chapter
    character
    title
    body { generate(:description) }
  end

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

  factory :character do
    user
    campaign
    name { generate(:username) }
    description
    pc_class { 'fighty' }
    level { generate(:number) }
  end

  factory :location do
    campaign
    name { generate(:title) }
    description { generate(:description) }
  end

  factory :setting_detail do
    campaign
    title
    description
  end

  factory :user do
    username
    email
    password { 'password' }
    password_confirmation { 'password' }
  end
end
