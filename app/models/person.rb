# == Schema Information
#
# Table name: people
#
#  id         :bigint           not null, primary key
#  birthday   :date
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Person < ApplicationRecord
  has_many :gifts_givens, dependent: :destroy

  validates :name, presence: true
  validates :birthday, presence: true

  def next_birthday
    bday = birthday.change(year: Date.today.year)
    bday < Date.today ? bday.next_year : bday
  end
end
