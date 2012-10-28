class Place < ActiveRecord::Base
  belongs_to :organisation
  attr_accessible :description, :name
end
