class SystemOperationLogsController < ApplicationController
  def index
    @system_operation_logs = SystemOperationLog.all
  end
end
