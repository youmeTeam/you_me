# == Schema Information
#
# Table name: users
#
#  id                              :integer          not null, primary key
#  email                           :string(255)      not null
#  crypted_password                :string(255)
#  salt                            :string(255)
#  created_at                      :datetime
#  updated_at                      :datetime
#  remember_me_token               :string(255)
#  remember_me_token_expires_at    :datetime
#  activation_state                :string(255)
#  activation_token                :string(255)
#  activation_token_expires_at     :datetime
#  nickname                        :string(255)
#  user_name                       :string(255)
#  reset_password_token            :string(255)
#  reset_password_token_expires_at :datetime
#  reset_password_email_sent_at    :datetime
#  profile_img                     :string(255)
#
# Indexes
#
#  index_users_on_activation_token      (activation_token)
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_remember_me_token     (remember_me_token)
#  index_users_on_reset_password_token  (reset_password_token)
#

class User < ActiveRecord::Base
  has_many :dreams, dependent: :destroy

  authenticates_with_sorcery!

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 120 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: true }
  validates :password, length: { minimum: 5 }, presence: true
  validates :nickname, presence: true
end
