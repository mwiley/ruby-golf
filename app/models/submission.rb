class Submission < ActiveRecord::Base
  belongs_to :challenge
  belongs_to :user

  paginates_per 5
end
