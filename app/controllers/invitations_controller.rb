class InvitationsController < ApplicationController
  def show
    @guest = Guest.find_by(id_hash: params[:id_hash])
  end
end
