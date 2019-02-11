class Event < ApplicationRecord
  
  has_many :attendances
  has_many :users, through: :attendances

  # La date de début est obligatoire et il est impossible de créer un événement dans le passé
  validates :start_date, presence: true

  # La durée est obligatoire et la durée doit être strictement positive et un multiple de 5
  validates :duration, presence: true, numericality: { only_integer: true }
  
  # Le titre est obligatoire et doit faire entre 5 et 140 caractères
  validates :title, presence: true, length: { minimum: 5, maximum: 140 }

  # La description est obligatoire et doit faire entre 20 et 1000 caractères  
  validates :description, presence: true, length: { minimum: 20, maximum: 1000 }
  
  # Le prix est obligatoire et compris entre 1 et 1000
  validates :price, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 1000 }

  # Le lieu est obligatoire 
  validates :location, presence: true

  def multiple_of_5
    if duration % 5 == 0
      return true
    else  
      return false
    end
  end
end