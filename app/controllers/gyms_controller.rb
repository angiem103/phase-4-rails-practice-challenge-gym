class GymsController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with:  :render_record_not_found

    def index
        gyms = Gym.all
        render json: gyms, include: :memberships
    end

    def show
        gym = Gym.find(params[:id])
        render json: gym, include: :memberships
    end

    def destroy
        gym = Gym.find(params[:id])
        gym.destroy
        head :no_content
    end

    private

    def render_record_not_found
        render json: {error: "Gym not found"}, satus: :not_found
    end
end
