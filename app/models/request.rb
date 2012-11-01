class Request < ActiveRecord::Base
  belongs_to :place
  attr_accessible :type, :place_id
  validates :place_id, presence: true
  validates :type, presence: true, :inclusion => ['Bill', 'Order']
end
