require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    create(:user)
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

  it 'is not valid without a password' do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a password digest' do
    subject.password_digest = nil
    expect(subject).to_not be_valid
  end

  it 'has no campaigns by default' do
    expect(subject.campaigns).to eq([])
  end

  it 'can own a campaign' do
    create(:campaign, user: subject)
    expect(subject.campaigns.count).to eq(1)
  end

  it 'can own a character' do
    create(:character, user: subject)
    expect(subject.characters.count).to eq(1)
  end
end
