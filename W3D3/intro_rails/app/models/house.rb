# == Schema Information
#
# Table name: houses
#
#  id          :bigint(8)        not null, primary key
#  adress      :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  resident_id :integer
#

class House < ApplicationRecord
  validates :adress, presence: true

  belongs_to :residents,
    primary_key: :id,
    foreign_key: :resident_id,
    class_name: :Person


end
