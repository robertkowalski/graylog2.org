helpers do

  def menu_link(where)
    mapping = {
      "/product/gelf" => "product"
    }

    current = request.path_info
    active = "class='active-main-menu-link'" if (current == "/#{where}" or (current == "/" and where == "home") or (mapping[current] != nil and mapping[current] == where)) or nil
    "<a href='/#{where}' #{active}>#{where.capitalize}</a>"
  end

end
