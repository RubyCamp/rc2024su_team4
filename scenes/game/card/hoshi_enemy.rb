class Enemy
    def initialize
        @image = Gosu::Image.new("hoshi.png") # 画像ファイルのパスを指定
        @width = 75
        @height = 65
      # 初期化処理
      @star_count=3
      @star_points=[
        [552, 10],
        [630, 10],
        [710, 10],
        [552, 70],
        [630, 70],
        [710, 70],
      ]
      puts "Enemyのインスタンスが作成されました"
    end

    def draw
        @star_count.times do |i|
            x = @star_points[i][0]
            y = @star_points[i][1]
            @image.draw(x, y, 1, @width.to_f / @image.width, @height.to_f / @image.height) 
        end
    end
    
    def add_star
        if @star_count < 6
            @star_count += 1
        end
    end
    def sub_star
        if @star_count > 0
            @star_count -= 1
        end
    end
end
