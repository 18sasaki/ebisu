class InvitationsController < ApplicationController
  def show
    @guest = Guest.find_by(id_hash: params[:id_hash])
    render file: "/public/unknown.html" unless @guest
  end
end
