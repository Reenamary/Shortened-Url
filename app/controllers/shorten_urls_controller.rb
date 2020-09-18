class ShortenUrlsController < ApplicationController

  def index
  end

  def create
    @shorten_url     = ShortenUrl.find_or_initialize_by(url: params[:shorten_url][:url])
    @shorten_url.format_url
    if @shorten_url.not_exists?
      respond_to do |format|
        if @shorten_url.save
          format.js {render layout: false}
        else
          flash.now[:danger] = "error" # not displayed
          format.html { render 'index' }
          format.json { render json: @shorten_url.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.js {render layout: false}
      end
    end
  end

  def update_count
    shorten_url = ShortenUrl.find(params[:id])
    ShortenUrl.increment_counter(:clicked, params[:id])
    user_ip             = request.remote_ip
    user_detail         = shorten_url.users.find_or_initialize_by(ip_address: user_ip)
    user_detail.country = Geocoder.search(user_ip).first.country
    if user_detail.save
      redirect_to shorten_url.url
    else
      render :index
    end
  end

  private 

  def url_params
    params.require(:shorten_url).permit(:url)
  end
end
