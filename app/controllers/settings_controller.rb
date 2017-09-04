class SettingsController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  def show; end

  def edit; end

  def update
    respond_to do |format|
      if @user.update(setting_params)
        format.html { redirect_to setting_path(@user), notice: 'Setting was successfully updated.' }
        format.json { render :show, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def setting_params
    params.require(:user).permit(:google_api_key, :google_calendar_id)
  end
end
