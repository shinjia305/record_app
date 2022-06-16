class SystemOperationLog < ApplicationRecord
  belongs_to :user, optional: true

  def self.create_log(user_id, message)
    SystemOperationLog.create(user_id: user_id, message: message)
  end
end
