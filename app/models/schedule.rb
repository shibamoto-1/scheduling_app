class Schedule < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates_with ScheduleValidator
  validates :all_day, inclusion: {in: [true, false]}
  validates :memo, length: { maximum: 200 }

end
