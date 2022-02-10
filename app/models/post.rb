class Post < ApplicationRecord

    validates name:, lenght: {maximum: 50}, presence: true
    validates content_public:, length: {maximum: 2000}
end
