class Ingredient < ActiveRecord::Base
  belongs_to :recipe
  attr_accessible :title, :description

  validates :title, :description, :presence => true
  validates :description, :presence => true,
            :length => { :minimum => 10 }

end
