# == Schema Information
#
# Table name: people
#
#  id         :bigint           not null, primary key
#  birthday   :date
#  names      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Person < ApplicationRecord
end
