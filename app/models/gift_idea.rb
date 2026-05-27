# == Schema Information
#
# Table name: gift_ideas
#
#  id          :bigint           not null, primary key
#  description :string
#  purchased   :boolean
#  url         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  person_id   :integer
#
class GiftIdea < ApplicationRecord
  belongs_to :person
  validates :description, presence: true
end
