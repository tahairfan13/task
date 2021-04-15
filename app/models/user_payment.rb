class UserPayment < ApplicationRecord
  belongs_to :user
  enum status: {paid:'paid' , cancelled: 'cancelled', unpaid: 'unpaid'}
end
