class Membership < ApplicationRecord
    validates :gym_id, presence:true
    validates :client_id, presence:true
    validates :charge, presence:true, numericality: {only_integer: true}

    belongs_to :gym
    belongs_to :client

    validates :client, uniqueness: { scope: :gym }
end
