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

  # heroku config:add AUTH_USER=foo AUTH_PASS=bar
  def authorized?
    return false if request.env['AUTH_USER'].nil? or request.env['AUTH_PASS'].nil?

    @auth ||=  Rack::Auth::Basic::Request.new(request.env)
    @auth.provided? && @auth.basic? && @auth.credentials && @auth.credentials == [request.env['AUTH_USER'], request.env['AUTH_PASS']]
  end

end
