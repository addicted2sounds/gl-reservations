class Reservation < ActiveRecord::Base
  belongs_to :table
  validates_presence_of :start_time, :end_time, :table
  validate :validate_time_period, :validate_table_is_free,
           if: Proc.new { |r| r.start_time.present? && r.end_time.present? }
  scope :table, ->(id) { where(table_id: id) }

  def validate_time_period
    if start_time > end_time
      errors.add(:end_time, :time_period_negative)
    end
  end

  def validate_table_is_free
    if Reservation.table(table_id).where.not(id: self.id).
        exists?(start_time: start_time...end_time)
      errors.add(:start_time, :table_is_already_reserved)
    end
    if Reservation.table(table_id).where.not(id: self.id).
        exists?(end_time: start_time..end_time)
      errors.add(:end_time, :table_is_already_reserved)
    end
  end
end
