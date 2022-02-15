class User < ApplicationRecord
    has_many :posts, class_name: "Post", foreign_key: "user_id"
    has_many :active_relationships, class_name: "Relationship",
                                    foreign_key: "follower_id",
                                    dependent: :destroy
    has_many :passive_relationships, class_name: "Relationship",
                                     foreign_key: "followed_id",
                                     dependent: :destroy
    #followeredsだと英語的におかしいので、followingに書き換え
    has_many :following, through: :active_relationships, source: :followed
    has_many :followers, through: :passive_relationships, source: :follower 
    

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
