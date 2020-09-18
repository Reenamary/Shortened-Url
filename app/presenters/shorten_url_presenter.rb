class ShortenUrlPresenter
  def initialize(shorten_url)
    @shorten_url = shorten_url
  end

  def link_title
    "http://localhost:3000/" + "#{@shorten_url.short_url}"
  end
end