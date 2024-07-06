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
  devise :authenticatable
end
