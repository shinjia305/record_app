class AdminsController < ApplicationController
  before_action :authenticate_admin!, only: %i[show]

  def show
    @admin = Admin.find(current_admin.id)
  end
end
