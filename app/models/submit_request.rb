class SubmitRequest < ActiveRecord::Base
  belongs_to :charger, class_name: 'User', foreign_key: 'charge_id'
  belongs_to :task
  belongs_to :user
end
