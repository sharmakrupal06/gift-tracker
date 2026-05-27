# == Schema Information
#
# Table name: gifts_givens
#
#  id         :bigint           not null, primary key
#  gift       :string
#  given_on   :date
#  liked      :string
#  notes      :text
#  occasion   :string
#  price      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  people_id  :integer
#
class GiftsGiven < ApplicationRecord
end
