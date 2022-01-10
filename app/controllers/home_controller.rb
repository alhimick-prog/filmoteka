class HomeController < ApplicationController
  def index
    @films = policy_scope(Film.all).sample(10)
  end
end
