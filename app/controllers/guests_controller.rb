class GuestsController < ApplicationController

  require "digest/md5"

  before_action :basic
  before_action :set_guest, only: [:show, :edit, :update, :destroy]

  # GET /guests
  # GET /guests.json
  def index
    @guests = Guest.all
  end

  # GET /guests/1
  # GET /guests/1.json
  def show
  end

  # GET /guests/new
  def new
    @guest = Guest.new
  end

  # GET /guests/1/edit
  def edit
  end

  # POST /guests
  # POST /guests.json
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

  # PATCH/PUT /guests/1
  # PATCH/PUT /guests/1.json
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

  # DELETE /guests/1
  # DELETE /guests/1.json
  def destroy
    @guest.destroy
    respond_to do |format|
      format.html { redirect_to guests_url, notice: 'Guest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guest
      @guest = Guest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guest_params
      params.require(:guest).permit(:name, :post_number, :address, :phone_number, :sex_bit, :child_bit, :invite_message, :host_bit, :tomo_message, :eri_message)
    end

    def basic
      authenticate_or_request_with_http_basic do |user, pass|
        user == Rails.application.secrets.basic_auth_user && pass == Rails.application.secrets.basic_auth_pass
      end
    end
end
