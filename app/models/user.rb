class User < ApplicationRecord
    has_many :posts, class_name: "Post", foreign_key: "user_id"

    def self.find_or_create_from_auth_hash(auth_hash)
        email = auth_hash[:info][:email]
        User.find_or_create_by(email: email) do |user|
            user.name = auth_hash[:info][:name]
            user.image = auth_hash[:info][:image]
        end
    end

end
