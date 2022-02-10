class HomeController < ApplicationController
    skip_before_action :check_logged_in, only: :new


end
