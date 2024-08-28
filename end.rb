require 'gosu'
require_relative 'hoshi'

class endding
  def initialize
    @hosi = @Hoshi.new
    
    @end_win = Gosu::Image.new(self,"imagess/Ruby_10.jpg", true) 
    @end_lose = Gosu::Image.new(self,"imagess/Ruby_10.jpg", true) 
    @end_hikiwake = Gosu::Image.new(self,"imagess/Ruby_10.jpg", true) 

    @win_images = false
    @lose_images = false
    @hikiwake_images = false
  end

  def update
    if key_push?(Gosu::KB_RETURN) 
      if ラウンド数 == 6
        if 星の数 < 3
          @lose_images =true
        end
        if 星の数 >3
          @win_images = true
        end
        if 星の数 == 3
          @hikiwake_images = true
        end


      if 星の数 == 0
        @lose_images = true
      end
      if 星の数 == 6
        @win_images = true
      end
      if 
  end

  def draw
    if @lose_images
      @end_lose.draw(0,0,0)
    end
    if @win_images
      @end_win.draw(0,0,0)
    end
    if @hikiwake_images
      @end_hikiwake.draw(0,0,0)
    end
  end

  
end

