class HomeController < ApplicationController
  def index
    @films = policy_scope(Film.all)
  end
end
