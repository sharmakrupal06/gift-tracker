# == Schema Information
#
# Table name: people
#
#  id           :bigint           not null, primary key
#  birthday     :date
#  name         :string
#  relationship :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint
#
# Indexes
#
#  index_people_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Person < ApplicationRecord
  has_many :gifts_givens, dependent: :destroy
  has_many :gift_ideas, dependent: :destroy
  belongs_to :user

  validates :name, presence: true
  validates :birthday, presence: true

  def next_birthday
    bday = birthday.change(year: Date.today.year)
    bday < Date.today ? bday.next_year : bday
  end
end
