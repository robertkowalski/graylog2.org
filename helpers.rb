helpers do

  def menu_link(where)
    mapping = {
      "/about/gelf" => "about"
    }

    current = request.path_info
    active = "class='active-main-menu-link'" if (current == "/#{where}" or (current == "/" and where == "home") or (mapping[current] != nil and mapping[current] == where)) or nil
    "<a href='/#{where}' #{active}>#{where.capitalize}</a>"
  end

  def authorize!
    unless authorized?
      response['WWW-Authenticate'] = %(Basic realm="ohai thar")
      throw(:halt, [401, "Not authorized\n"])
    end
  end

  def authorized?
    @auth ||=  Rack::Auth::Basic::Request.new(request.env)
    @auth.provided? && @auth.basic? && @auth.credentials && @auth.credentials == ["lol", "wat"]
  end

end
