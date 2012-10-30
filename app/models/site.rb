class Site < ActiveRecord::Base
  belongs_to :organisation
  attr_accessible :name, :description
  has_many :places, :dependent => :destroy
  validates :name, :presence => true
  validates :organisation_id, :presence => true
end
