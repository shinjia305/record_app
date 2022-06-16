class User < ApplicationRecord
  has_many :system_operation_logs
  validates :name, presence: true
end
