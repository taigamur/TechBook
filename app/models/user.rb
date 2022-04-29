class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :active_relationships,  class_name:  "Relationship",
                                     foreign_key: "follower_id",
                                     dependent:   :destroy
    has_many :passive_relationships, class_name:  "Relationship",
                                     foreign_key: "followed_id",
                                     dependent:   :destroy
    has_many :following, through: :active_relationships,  source: :followed
    has_many :followers, through: :passive_relationships, source: :follower
    has_one_attached :image

    validates :image, content_type:{in:%w[image/jpeg image/gif image/png],
                message:"must be a valid image format"},
                size: {less_than: 5.megabytes,
                message: "should be less than 5MB"}

    def self.find_or_create_from_auth_hash(auth_hash)
        email = auth_hash[:info][:email]
        User.find_or_create_by(email: email) do |user|
            user.name = email # nameをemailとして新規作成する
        end
    end

    def follow(other_user)
        following << other_user
    end

    def unfollow(other_user)
        active_relationships.find_by(followed_id: other_user.id).destroy
    end

    def following?(other_user)
        following.include?(other_user)
    end

end
