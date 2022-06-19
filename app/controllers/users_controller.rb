class UsersController < ApplicationController
  before_action :authenticate_admin!, only: %i[show new create destroy]
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.all
    SystemOperationLog.create_log(current_admin.id, "#{current_admin.name}がユーザー一覧画面を開きました", {})
  end

  def show
    SystemOperationLog.create_log(current_admin.id, "#{current_admin.name}が#{@user.name}の詳細画面を開きました", {})
  end

  def new
    @user = User.new
    SystemOperationLog.create_log(current_admin.id, "#{current_admin.name}がユーザー新規作成画面を開きました", {})
  end

  def edit
    SystemOperationLog.create_log(current_admin.id, "#{current_admin.name}が#{@user.name}の編集画面を開きました", {})
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        SystemOperationLog.create_log(current_admin.id, "#{current_admin.name}が#{@user.name}を作成しました", @user.saved_changes)
        format.html { redirect_to @user, notice: "#{@user.name}を作成しました" }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        SystemOperationLog.create_log(current_admin.id, "#{current_admin.name}が#{@user.name}を更新しました", @user.saved_changes)
        format.html { redirect_to @user, notice: "#{@user.name}を更新しました" }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      SystemOperationLog.create_log(current_admin.id, "#{current_admin.name}が#{@user.name}を削除しました", @user.saved_changes)
      format.html { redirect_to users_url, notice: "ユーザーを削除しました" }
      format.json { head :no_content }
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name)
    end
end
