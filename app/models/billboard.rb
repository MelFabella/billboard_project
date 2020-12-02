class Billboard < ApplicationRecord
  # Associations
  # dependent is only in the parent, deletes child.  
  has_many :artists, dependent: :destroy
  has_many :songs, dependent: :destroy
end
