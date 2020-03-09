module ApplicationHelper
  def year
    Date.today.year
  end

  def github_url(caption, path)
    link_to caption, "https://github.com/#{path}", target: "_blank"
  end

  def show_flash_message
    css_style = { alert: 'flash alert'}
    content_tag :p, flash[:alert], class: css_style[:alert]
  end

end
