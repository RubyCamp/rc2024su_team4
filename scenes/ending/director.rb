module Scenes
  module Ending
    # エンディングシーンの担当ディレクタークラス
    class Director < DirectorBase
      # コンストラクタ
      def initialize(hantei: 0)
        super()
        @lose_img = Gosu::Image.new("images/lose.jpg", tileable: true)
        @win_img = Gosu::Image.new("images/win.jpg", tileable: true)
        @hikiwake_img = Gosu::Image.new("images/draw.jpg", tileable: true)
        @bgm = load_bgm("bgm3.mp3", 0.3)
        @hantei = hantei
      end

      # 1フレーム分の更新処理
      def update(opt = {})
        @bgm.play if @bgm && !@bgm.playing?
      end

      # 1フレーム分の描画処理
      def draw
        puts "Hantei value: #{@hantei}"  # デバッグ出力
        if @hantei == 1
          @lose_img.draw(0, 0, 0)
        elsif @hantei == 2
          @win_img.draw(0, 0, 0)
        else
          @hikiwake_img.draw(0, 0, 0)
        end
      end
    end
  end
end