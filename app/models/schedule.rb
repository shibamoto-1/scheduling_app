class Schedule < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_greater_than_or_equal_to_start_date
  validates :all_day, presence: true
  validates :memo, length: { maximum: 200 }

  def end_date_greater_than_or_equal_to_start_date
    if end_date < start_date
      errors.add(:end_date, "終了日は開始日より手前に設定出来ません")
    end
  end
end
