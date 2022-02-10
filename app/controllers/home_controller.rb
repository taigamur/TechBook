class HomeController < ApplicationController
    # skip_before_action :check_logged_in, only: :index

    def index

    end

    def show
    end

    def new
    end

    def update
    end

    def edit
        current_user
    end


    

end
