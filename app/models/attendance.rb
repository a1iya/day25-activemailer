class Attendance < ApplicationRecord
	after_create :inscription

	belongs_to :user
	belongs_to :event

	validates :stripe_customer_id, presence: true, uniqueness: true

	def inscription
	  AttendanceMailer.join_event(self).deliver_now
	end
end
