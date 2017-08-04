class InvitationsController < ApplicationController
  def show
    @guest = Guest.find_by(id_hash: params[:id_hash])
    @attend_type = case @guest.attend_bit
                   when nil then "none"
                   when true then "attend"
                   when false then "absent"
                   end
    render file: "/public/unknown.html" unless @guest
    render 'show_2'
  end

  def reply
    @guest = Guest.find_by(id_hash: params[:id_hash])
    @guest.attend_bit = params[:attend_bit]
    @guest.guest_message = params[:guest_message]
    @guest.allergy_comment = params[:allergy_comment]

    respond_to do |format|
      if @guest.save(context: :by_guest)
        p ">>>>>>>>>>>>>"
        p @guest.attributes
        format.html { render :reply, notice: "返信ありがとう！！" }
        format.json { render :reply, status: :ok }
      else
        format.html { render :show_2 }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_guest
      @guest = Guest.find_by(id_hash: params[:id_hash])
    end
end
