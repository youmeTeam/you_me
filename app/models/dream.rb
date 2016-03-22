# == Schema Information
#
# Table name: dreams
#
#  id          :integer          not null, primary key
#  content     :text(65535)
#  likes_count :integer          default(0)
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_dreams_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_a241581da0  (user_id => users.id)
#

class Dream < ActiveRecord::Base
  belongs_to :user
end
