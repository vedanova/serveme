class Organisation < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name
  has_many :sites, :dependent => :destroy
  validates :name, :presence => true
  validates :user_id, :presence => true
end
