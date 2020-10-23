# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  attachment :string
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Post < ApplicationRecord

    belongs_to(
        :user,
        class_name: 'User',
        foreign_key: 'user_id',
        inverse_of: :posts
    )

    has_many :likes, dependent: :destroy
    has_rich_text :content

end
