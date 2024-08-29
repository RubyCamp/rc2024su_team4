require 'gosu'

#require_relative "hoshi"
require_relative "enemy"
require_relative "me"
# require_relative "font_director"

class GameWindow < Gosu::Window
#   font_director = FontDirector.new
  @@key_state = {} # キーの押下判定（押しっ放しではなく、1回押して離すまでを1回と捉える判定）用キャッシュ

  def initialize
    super 800, 600
    self.caption = "Background Image with Rectangle and Resized Image"

    #@hoshi = Hoshi.new
    # バックグラウンド画像を読み込む
    @background_image = Gosu::Image.new("geme.png") # バックグラウンド画像のパスを指定
    
      @disp_flg = false
      @me = Me.new
      @enemy = Enemy.new
      # @caunnt = Key.new
  end


  def update
    # 更新処理（必要に応じて追加）
    if key_push? Gosu::KB_UP
      @enemy.add_star
      @me.sub_star
    end
    if key_push? Gosu::KB_DOWN
      @enemy.sub_star
      @me.add_star

      
    end

  end

  
  def draw
   #バックグラウンド画像を描画
    @background_image.draw(0, 0, 0, width.to_f / @background_image.width, height.to_f / @background_image.height)
    @disp_flg = !@disp_flg if Gosu.button_down?(Gosu::MsLeft)
    # font_director.draw

    if @disp_flg
      # 四角形の枠線を描画
      @hoshi.draw
    end
    @enemy.draw
    @me.draw
    # @caunnt.draw
  end
    
 # 四角形の枠線を描画するためのメソッド
  def draw_rectangle_outline(x, y, width, height, color)
    # 上辺
    Gosu.draw_line(x, y, color, x + width, y, color, 0)
    # 右辺
    Gosu.draw_line(x + width, y, color, x + width, y + height, color, 0)
    # 下辺
    Gosu.draw_line(x + width, y + height, color, x, y + height, color, 0)
    # 左辺
    Gosu.draw_line(x, y + height, color, x, y, color, 0)
  end
  
  # キーの押下判定
  # ※ 単純に「Gosu.button_down?」だけで判定すると毎フレームで押しっ放し判定になってしまうため、「押して離す」を1セットとした押下判定を行うためのメソッド
  def key_push?(key_label)
    if !@@key_state[key_label] && Gosu.button_down?(key_label)
      @@key_state[key_label] = true
      return true
    end

    if @@key_state[key_label] && !Gosu.button_down?(key_label)
      @@key_state[key_label] = false
    end

    return false
  end
end

# ウィンドウを作成して実行
window = GameWindow.new
window.show
