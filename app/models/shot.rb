class Shot < ApplicationRecord
    belongs_to :user
    has_one_attached :user_shot
end
