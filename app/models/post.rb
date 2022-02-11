class Post < ApplicationRecord

    validates :name, length: {maximum: 50}, presence: true
    validates :content_public, length: {maximum: 2000}
    validates :content_private, length: {maximum: 2000}

    def created_by?(user)
        return false unless user
            user_id = user.id
    end
end
