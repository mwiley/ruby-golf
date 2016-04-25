class Challenge < ActiveRecord::Base
  has_many :submissions, dependent: :destroy

  paginates_per 10
end
