class Challenge < ActiveRecord::Base
  has_many :submissions, dependent: :destroy
end
