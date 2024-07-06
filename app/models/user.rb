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
class User < ApplicationRecord
  validates :uid, presence: true, uniqueness: { scope: :provider }
  validates :provider, presence: true

  devise :authenticatable, :omniauthable, omniauth_providers: [:developer]

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid)
  end
end
