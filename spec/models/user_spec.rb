require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(
      username: 'bobo',
      email: 'bobo@gmail.com',
      password: 'password',
      password_confirmation: 'password'
    )
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a username' do
    subject.username = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end
end
