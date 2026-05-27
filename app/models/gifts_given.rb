# == Schema Information
#
# Table name: gifts_givens
#
#  id         :bigint           not null, primary key
#  gift       :string
#  given_on   :date
#  liked      :boolean          default(FALSE)
#  notes      :text
#  occasion   :string
#  price      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  person_id  :integer
#
class GiftsGiven < ApplicationRecord
  belongs_to :person

  validates :gift, presence: true
  validates :given_on, presence: true
end
