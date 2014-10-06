class KissResult < ActiveRecord::Base
  belongs_to :kiss_task
  belongs_to :server
end
