module GiftsHelper
  def randomize(*arr)
    if (arr.length == 0)
      return 0
    end
    return arr[rand(arr.length)]
  end

  def current_url(overwrite={})
    url_for :only_path => false, :params => params.merge(overwrite)
  end

  def session_increment
    if session[:count]
      session[:count] += 1
    else
      session[:count] = 0
    end
  end

  def sc
    session[:count].to_i
  end

  def save_referer
    unless session['referer']
      session['referer'] = request.env["HTTP_REFERER"] || 'none'
    end
  end

  def ref
    if session['referer']
       session['referer']
    else
      "nowhere"
    end
  end
    

end
