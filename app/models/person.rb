class Person < ActiveRecord::Base
  belongs_to :category
  belongs_to :region
end
