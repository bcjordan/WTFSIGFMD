module GiftsHelper
  def randomize(*arr)
    if (arr.length == 0)
      return 0
    end
    return arr[rand(arr.length)]
  end
end
