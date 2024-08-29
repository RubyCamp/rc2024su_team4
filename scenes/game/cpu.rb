module Scenes
  module Game
    class CPU
      attr_accessor :NPC_hand
      def initialize
        @number = [1,1,2,2,3,3] #1がグー2がチョキ3がパー
        @selected_image = nil
        @gu_image = Gosu::Image.new("images/gu_image.png",tileable: true)
        @choki_image = Gosu::Image.new("images/choki_image.png",tileable: true)
        @pa_image = Gosu::Image.new("images/pa_image.png",tileable: true)
      end

      def randamu
        #ランダムにNPCの手を決める
        random_element = @number.sample
        # puts random_element
    
        if random_element == 1
          index1 = @number.index(1)
          @number.delete_at(index1) if index1
          @selected_image = @gu_image
          return "gu"
        end

        if random_element == 2
          index2 = @number.index(2)                
          @number.delete_at(index2) if index2
          @selected_image = @choki_image
          return "choki"
        end

        if random_element == 3
          index3 = @number.index(3)
          @number.delete_at(index3) if index3
          @selected_image = @pa_image
          return "pa"
        end
      end

      def draw 
        if @selected_image
          @selected_image.draw(440, 230, 3)
        end
      end
    end
  end
end