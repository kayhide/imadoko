class Entry < ActiveRecord::Base
  belongs_to :race
  has_many :footprints, dependent: :destroy

  STATUSES = [nil, 'running', 'finished', 'dns', 'dnf']

  validates_presence_of :race_id
  validates_presence_of :number
  validates_inclusion_of :status, in: STATUSES
end
