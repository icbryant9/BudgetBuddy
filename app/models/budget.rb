# == Schema Information
#
# Table name: budgets
#
#  id         :bigint           not null, primary key
#  month      :string
#  year       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_budgets_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Budget < ApplicationRecord
    belongs_to(
        :user,
        class_name: 'User',
        foreign_key: 'user_id',
        inverse_of: :budgets
    )

    has_many :groups, :dependent => :delete_all
     

      validates :month, presence: true, uniqueness: true
    validates :year, presence: true, uniqueness: true
end
