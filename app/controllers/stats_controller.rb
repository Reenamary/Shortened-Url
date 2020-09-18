class StatsController < ApplicationController
  def index
    @stats  = ShortenUrl.eager_load(:users).paginate(page: params[:page])
  end
end
