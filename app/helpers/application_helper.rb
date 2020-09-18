module ApplicationHelper
  def link_title(short_url)
    "#{request.host_with_port}/" + "#{short_url}"
  end

  def show_countries(rec)
    rec.users.pluck(:country).join(',')
  end
end
