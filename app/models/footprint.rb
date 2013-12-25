class Footprint < ActiveRecord::Base
  belongs_to :entry

  validates_presence_of :entry_id
  validates_presence_of :distance
  validates_presence_of :passed_at
end
