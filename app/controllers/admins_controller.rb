class AdminsController < ApplicationController
  def show
    @admin = Admin.find(current_admin.id)
  end
end
