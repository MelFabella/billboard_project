class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy
  has_many :billboard, through: :songs
  
end
