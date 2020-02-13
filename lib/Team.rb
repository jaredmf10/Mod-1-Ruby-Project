class Team < ActiveRecord::Base
    belongs_to :gm
    has_many :players
end