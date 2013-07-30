class Recipe < ActiveRecord::Base
  attr_accessible :description, :name
  validates :name, :presence => true

  has_many :ingredients, :dependent => :delete_all
end
