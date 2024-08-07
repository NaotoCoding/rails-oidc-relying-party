# == Schema Information
#
# Table name: users
#
#  id       :bigint           not null, primary key
#  provider :string           not null
#  uid      :string           not null
#
# Indexes
#
#  index_users_on_uid_and_provider  (uid,provider) UNIQUE
#
require "rails_helper"

RSpec.describe User, type: :model do
  it "ファクトリーが有効" do
    expect(build(:user)).to be_valid
  end
end
