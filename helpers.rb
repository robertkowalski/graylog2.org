helpers do

  def menu_link(where)
    current = request.path_info
    active = "class='active-main-menu-link'" if (current == "/#{where}" or (current == "/" and where == "home")) or nil
    "<a href='/#{where}' #{active}>#{where.capitalize}</a>"
  end

end
