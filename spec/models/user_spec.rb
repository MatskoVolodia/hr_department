require 'rails_helper'

describe User, type: :model do
  before { build(:employee) }

  it { should have_many(:user_group_users) }
  it { should have_many(:user_groups) }

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  it { should validate_length_of(:password).is_at_least(6) }
end