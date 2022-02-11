class HomeController < ApplicationController
    skip_before_action :authenticate, only: :new


end
