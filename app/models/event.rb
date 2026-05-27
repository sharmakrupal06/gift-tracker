# == Schema Information
#
# Table name: events
#
#  id         :bigint           not null, primary key
#  date       :date
#  event_type :string
#  note       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  person_id  :bigint
#
# Indexes
#
#  index_events_on_person_id  (person_id)
#
# Foreign Keys
#
#  fk_rails_...  (person_id => people.id)
#
class Event < ApplicationRecord
  belongs_to :person

  def next_occurrence
    occurrence = date.change(year: Date.today.year)
    occurrence < Date.today ? occurrence.next_year : occurrence
  end
end
