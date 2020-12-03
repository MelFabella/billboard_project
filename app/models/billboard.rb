class Billboard < ApplicationRecord
  # Associations
  # dependent is only in the parent, deletes child.  
  has_many :artists, dependent: :destroy
  has_many :songs, dependent: :destroy

  # make sure that data comes in following certain constraints.
  validates :title, :description, presence: true
end
