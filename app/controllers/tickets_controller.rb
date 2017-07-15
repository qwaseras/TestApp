class TicketsController < ApplicationController
  def new
    @ticket = Ticket.new
  end

  def create
    params_with_id = ticket_params
    params_with_id[:user_id] = current_user.id
    @ticket = current_user.tickets.build(params_with_id)
    if @ticket.save
      redirect_to room_path
      end
  end

  def edit
    @ticket = Ticket.find(ticket_params[:id])
    #if @ticket.update_attributes(ticket_params[:answer])
     # redirect_to room_path
    #end
  end

  def ticket_params
      params.require(:ticket).permit(:content, :answer)
  end
end
