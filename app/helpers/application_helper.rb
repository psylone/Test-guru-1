module ApplicationHelper

  def year
    Date.today.year
  end

  def github_url(caption, path)
    link_to caption, "https://github.com/#{path}", target: "_blank"
  end
end
