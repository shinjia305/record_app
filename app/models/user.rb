class User < ApplicationRecord
  has_many :system_operation_logs, dependent: :destroy
  validates :name, presence: true
end
