class ScheduleValidator < ActiveModel::Validator
  def validate(record)
    if record.start_date.present? && record.end_date.present? && record.end_date < record.start_date
      record.errors.add(:end_date, "は開始日より後の日付でなければなりません")
    end
  end
end
