class Event < ApplicationRecord

  has_many :attendances
  has_many :users, through: :attendances

  validates :start_date, presence: true, unless: :start_date_cant_be_in_the_past
  validates :duration, presence: true, numericality: { only_integer: true }
  validate :multiple_of_5
  validates :title, length: { in: 5..140 }, presence: true
  validates :description, length: {in: 20..1000}, presence: true
  validates :location, presence: true
  validates :price, presence: true, length: { in: 1..1000 }, numericality: { only_integer: true }

  # Method to prevent creating past events
  def start_date_cant_be_in_the_past
    if start_date.present? && start_date < DateTime.now
      return "L'évènement ne peut pas être créé dans le passé. Veuillez réessayer"
    end
  end

  def multiple_of_5
    if duration % 5 == 10
      return true
    else
      return false
    end
  end
end
