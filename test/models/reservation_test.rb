require 'test_helper'

class ReservationTest < ActiveSupport::TestCase
  test 'should save the reservation' do
    reservation = FactoryGirl.build(:reservation)
    assert reservation.save
  end

  test 'should not save the reservation because start_date is in the past' do
    reservation = FactoryGirl.build(:reservation, start_date: DateTime.new(2012, 0o1, 0o1), end_date: DateTime.new(2022, 0o1, 0o1))
    assert_not reservation.save
  end

  test 'should not save the reservation because end_date is in the past' do
    reservation = FactoryGirl.build(:reservation, start_date: DateTime.new(2022, 0o1, 0o1), end_date: DateTime.new(2012, 0o1, 0o1))
    assert_not reservation.save
  end

  test 'should not save the reservation because end_date is smaller then start date' do
    reservation = FactoryGirl.build(:reservation, start_date: DateTime.new(2022, 0o2, 0o2), end_date: DateTime.new(2022, 0o2, 0o1))
    assert_not reservation.save
  end

  test 'should not save the reservation because it overlaps another reservation' do
    room = FactoryGirl.create(:room) #make sure the reservations have the same room
    FactoryGirl.create(:reservation, start_date: DateTime.new(2022, 0o2, 0o2), end_date: DateTime.new(2022, 0o2, 0o3), room: room)
    reservation = FactoryGirl.build(:reservation, start_date: DateTime.new(2022, 0o2, 0o2), end_date: DateTime.new(2022, 0o2, 0o3), room: room)
    assert_not reservation.save
  end
end
