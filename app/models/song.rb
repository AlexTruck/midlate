class Song < ActiveRecord::Base
  validates_presence_of :title, :description
  ratyrate_rateable "mark"
end