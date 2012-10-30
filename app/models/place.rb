class Place < ActiveRecord::Base
  belongs_to :site
  attr_accessible :description, :name
end
