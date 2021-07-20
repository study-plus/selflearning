class Event < ApplicationRecord

    belongs_to :user, dependent: :destroy, optional: true
    validates :user_id, presence: true

    def start_time
        self.start
    end

    def end_time
        self.end
    end
end
