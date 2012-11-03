class Request < ActiveRecord::Base
  belongs_to :place
  attr_accessible :type, :place_id
  validates :place_id, presence: true
  validates :type, presence: true, :inclusion => ['Bill', 'Order']

  after_create :push_msg

  def push_msg
     place_name = place.name
     site_name = place.site.name
     time_at =  Time.now.strftime("%H:%M:%S")
     msg = "#{time_at} - #{self.type}: #{place_name} (#{site_name})"
     Pusher[PUSHER_REQUEST_CHANNEL].trigger('new_request', {:message => msg})
  end

end
