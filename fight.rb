require 'gosu'
require_relative 'path/myhand' 
require_relative 'path/CPUhand'


class fight
    attr_accessor :fighting
  def initialize
    t = myhandclass.new #自分のグーかチョキかパー
    r =CPUhandclass.new #相手のグーかチョキかパー
    
    @fighting = ""
    @images = Gosu::Image.new(self,"imagess/Ruby_9.jpg", true) 

    @win = Gosu::Image.new(self,"imagess/Ruby_9.jpg", true) 
    @lose = Gosu::Image.new(self,"imagess/Ruby_9.jpg", true) 
    @hikiwake =Gosu::Image.new(self,"imagess/Ruby_9.jpg", true) 

    @show_image1 = false
    @show_image2 = false
    @show_image3 = false
    @show_image4 = false
  end
  
  def update
    @hand = t.hantei
    @NPC_hand = r.hantei
    hand = [@hand,@NPC_hand]
    if key_push?(Gosu::KB_RETURN) 
        @show_image = true
        judge(hand)
    end
    
  end
  
  def draw
    if @show_image1
        @myhand.draw(xxx, xxx, 0)#表（自分のハンド，座標
        @NPC_hand.draw(xxx, xxx, 0)#表（CPUのハンド，座標
    end
    if @show_image2
        @win.draw(xxx,xxx,0)
    end
    if @show_image3
        @lose.draw(xxx,xxx,0)
    end
    if @show_image4
        @hikiwake.draw(xxx,xxx,0)
    end
  end

  def judge(hand)
    case hand
        when ->(hand){[["gu-","pa-"],["tyoki","gu-"],["pa-","tyoki"]].include?(hand)}
            @fighting = "lose"
            @show_image3 =true
        when ->(hand){["gu-","tyoki"],["tyoki","pa-"],["pa-","gu-"]}
            @fighting = "win"
            @show_image3 =true
        when ->(hand){["gu-","gu-"],["tyoki","tyoki"],["pa-","pa-"]}
            @fighting = "hikiwake"
            @show_image3 =true
     end
   end


end





