class Feedback < ActiveRecord::Base
  include ActiveModel::Validations
  belongs_to :place
  attr_accessible :content, :email, :phone, :subject, :place_id
  validates :email, email: true, length: 0..255
  validates :subject, length: 0..255

  after_create :push_msg

  def push_msg
    place_name = place.name
    site_name = place.site.name
    time_at = Time.now.strftime("%H:%M:%S")
    msg = "#{time_at} -  Feedback: #{place_name} (#{site_name}): #{subject} -- \n #{content}"
    Pusher[PUSHER_REQUEST_CHANNEL].trigger('new_request', {:message => msg})
  end
end
