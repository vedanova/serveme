class Request < ActiveRecord::Base
  belongs_to :place
  attr_accessible :type, :place_id
  validates :place_id, presence: true
  validates :type, presence: true, :inclusion => ['Bill', 'Order']

  after_create :push_msg

  def push_msg
     site = place.site
     time_at =  Time.now.strftime("%H:%M")
     msg = "#{time_at} - #{self.type}"
     Pusher["site-#{site.id}-channel"].trigger("new-request", {:message => msg, site: site.id, place: place.id })
  end

end
