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

end
