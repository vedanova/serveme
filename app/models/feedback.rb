class Feedback < ActiveRecord::Base
  include ActiveModel::Validations
  belongs_to :place
  attr_accessible :content, :email, :phone, :subject, :place_id
  validates :email, email: true, length: 0..255
  validates :subject, length: 0..255
end
