class Post < ApplicationRecord

    validates :name, length: {maximum: 50}, presence: true
    validates :content_public, length: {maximum: 2000}
    validates :content_private, length: {maximum: 2000}
    validates :point, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5}
    validates :difficulty , presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5}
    validates :volume , presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5}

    def created_by?(user)
        return false unless user
            user_id = user.id
    end
end
