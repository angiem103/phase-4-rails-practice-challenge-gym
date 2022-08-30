class MembershipsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with:  :render_record_not_found

    def index
        memberships = Membership.all
        render json: memberships, include: [ :gym, :client ]
    end

    private

    def render_record_not_found
        render json: {error: "Membership not found"}, satus: :not_found
    end
    
end
