class Race < ActiveRecord::Base
  has_many :entries, dependent: :destroy

  validates_presence_of :label
  validates_presence_of :url
  validates_presence_of :distance

  module Distance
    FULL_MARATHON = 42.195
    HALF_MARATHON = FULL_MARATHON / 2
  end
end
