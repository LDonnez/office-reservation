require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  test 'Should save the room' do
    room = FactoryGirl.build(:room, name: 'test')
    assert room.save
  end

  test 'Should not save the room' do
    room = FactoryGirl.build(:room, name: '')
    assert_not room.save
  end
end
