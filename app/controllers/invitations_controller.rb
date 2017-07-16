class InvitationsController < ApplicationController
  def show
    @guest = Guest.find_by(id_hash: params[:id_hash])
    render file: "/public/unknown.html" unless @guest
  end

  def reply
    @guest = Guest.find_by(id_hash: params[:id_hash])
p ">>>>>>>>>>>>>>>"
p @guest
p ">>>>>>>>>>>>>>>"
    @guest.attend_bit = params[:attend_bit]
p @guest.attend_bit
p ">>>>>>>>>>>>>>>"
    @guest.guest_message = params[:guest_message]

    respond_to do |format|
      if @guest.save
        format.html { redirect_to 'show', notice: "返信ありがとう！！" }
        format.json { render :show, status: :ok }
      else
        format.html { render :show }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_guest
      @guest = Guest.find_by(id_hash: params[:id_hash])
    end
end
