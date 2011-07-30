class Book < ActiveRecord::Base
  scope :checked_out, where(:checked_out => true).order("publish_year")
  scope :checked_in, where(:checked_out => false).order("publish_year")
  scope :search, lambda { |query|
    where([ "title LIKE ?", "%#{query}%" ])
  }
end
