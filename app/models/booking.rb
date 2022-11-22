class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :place
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date
  validate :range_date

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

  def range_date
    date_ranges = Booking.all.map { |b| b.start_date..b.end_date }
    date_ranges.each do |range|
      if range.include? start_date
        return errors.add(:start_date, "Already booked for this date")
      elsif range.include? end_date
        return errors.add(:end_date, "Already booked for this date")
      end
    end
  end
end
