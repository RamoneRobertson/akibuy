class Auction < ApplicationRecord
  belongs_to :user
  has_many :bids
  validates :start_time, :end_time, presence: true
  validate :check_dates, on: :create

  def check_dates
    if start_time < Date.today
      errors.add(:start_time, "Cannot be in the past")
    elsif end_time < Date.today
      errors.add(:end_time, "Cannot be in the past")
    end

    if end_time < start_time
      errors.add(:end_time, "Must be after the Start time")
    end
  end
end
