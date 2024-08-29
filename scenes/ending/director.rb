module Scenes
  module Ending
    # エンディングシーンの担当ディレクタークラス
    class Director < DirectorBase
      # コンストラクタ
      def initialize(hantei: 0)
        super()  # 親クラスのinitializeを呼び出す
        @lose_img = Gosu::Image.new("images/lose.jpg", tileable: true)
        @win_img = Gosu::Image.new("images/win.jpg", tileable: true)
        @hikiwake_img = Gosu::Image.new("images/draw.jpg", tileable: true)
        @bgm = load_bgm("bgm3.mp3", 0.3)
        @hantei = hantei  # 引数で受け取った値をインスタンス変数に設定
      end

      # 1フレーム分の更新処理
      def update(opt = {})
        @bgm.play if @bgm && !@bgm.playing?
      end

      # 1フレーム分の描画処理
      def draw
        case @hantei
        when 1
          @lose_img.draw(0, 0, 0)
        when 2
          @win_img.draw(0, 0, 0)
        when 0
          @hikiwake_img.draw(0, 0, 0)
        end
      end
    end
  end
end
