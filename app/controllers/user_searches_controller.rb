class UserSearchesController < ApplicationController

    def new

    end

    def index
        s = params['keyword']
        @users = User.where('name LIKE ?', '%'+s+'%')
    end

end
