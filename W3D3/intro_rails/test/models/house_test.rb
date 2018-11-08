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

require 'test_helper'

class HouseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
