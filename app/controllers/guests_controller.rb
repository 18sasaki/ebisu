class GuestsController < ApplicationController

  require "digest/md5"

  before_action :basic
  before_action :set_guest, only: [:show, :edit, :update, :destroy]

  def index
    @guests = Guest.all
  end

  def show
  end

  def new
    @guest = Guest.new
  end

  def edit
  end

  def create
    @guest = Guest.new(guest_params)
    @guest.id_hash = Digest::MD5.hexdigest('tomo' + guest_params[:name] + 'eri')

    respond_to do |format|
      if @guest.save
        format.html { redirect_to :guests, notice: "#{@guest.name}様を追加しました。" }
        format.json { render :index, status: :ok }
      else
        format.html { render :new }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @guest.update(guest_params)
        format.html { redirect_to :guests, notice: "#{@guest.name}様を更新しました。" }
        format.json { render :index, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @guest.destroy
    respond_to do |format|
      format.html { redirect_to guests_url, notice: 'Guest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_guest
      @guest = Guest.find(params[:id])
    end

    def guest_params
      params.require(:guest).permit(:name, :post_number, :address_!, :address_2, :phone_number, :mail_address, :sex_bit, :child_bit, :invite_message, :host_bit, :tomo_message, :eri_message, :group_string)
    end

    def basic
      authenticate_or_request_with_http_basic do |user, pass|
        user == Rails.application.secrets.basic_auth_user && pass == Rails.application.secrets.basic_auth_pass
      end
    end
end
