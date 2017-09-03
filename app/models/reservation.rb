class Reservation < ApplicationRecord
  belongs_to :room
  validates :start_date, :end_date, :room, presence: true
  validate :start_date_should_be_in_future
  validate :end_date_should_be_in_future
  validate :end_date_should_be_bigger_then_start_date
  validate :should_not_overlap

  def overlaps?
    return unless room.present?
    Reservation.where('(start_date, end_date) OVERLAPS (?, ?)', start_date + 1.second, end_date).where(room: room).where.not(id: id).exists?
  end

  def start_date_should_be_in_future
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, 'should be in the future')
    end
  end

  def end_date_should_be_in_future
    if end_date.present? && end_date < Date.today
      errors.add(:end_date, 'should be in the future')
    end
  end

  def end_date_should_be_bigger_then_start_date
    if end_date.present? && end_date < start_date
      errors.add(:end_date, 'should be bigger then start date')
    end
  end

  def should_not_overlap
    errors.add(:base, 'overlaps with another reservation') if overlaps?
  end
end
