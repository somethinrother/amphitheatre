require 'rails_helper'

RSpec.describe SettingDetail, type: :model do
  subject do
    create(:setting_detail)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a campaign' do
    subject.campaign = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a description' do
    subject.description = nil
    expect(subject).to_not be_valid
  end
end
