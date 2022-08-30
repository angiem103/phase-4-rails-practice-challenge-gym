class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with:  :render_record_not_found

    def index
        clients = Client.all
        render json: clients, include: :memberships
    end

    def show
        client =  Client.find(params[:id])
        render json: client, include: :memberships
    end

    private

    def render_record_not_found
        render json: {error:    "Client not found"}, satus: :not_found
    end
end
