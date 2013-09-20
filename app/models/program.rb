class Program < ActiveRecord::Base
  attr_accessible :code, :subtitle, :title
  validates :title, :subtitle, :presence => true
  validates :code, :presence => true, length: {is: 6}
end
