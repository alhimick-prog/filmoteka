class HomeController < ApplicationController
  skip_after_action :verify_authorized

  def index
    @films = policy_scope(Film.all)
  end
end
