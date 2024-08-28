module Scenes
  module Game
    class CPU
      attr_accessor :NPC_hand
      def initialize
        @number = [1,1,2,2,3,3] #1がグー2がチョキ3がパー
      end

      def randamu
        #ランダムにNPCの手を決める
        random_element = @number.sample
        # puts random_element
    
        if random_element == 1
          index1 = @number.index(1)
          @number.delete_at(index1) if index1
          
          return "gu"
        end

        if random_element == 2
          index2 = @number.index(2)                
          @number.delete_at(index2) if index2
          
          return "choki"
        end

        if random_element == 3
          index3 = @number.index(3)
          @number.delete_at(index3) if index3

          return "pa"
        end
      end
    end
  end
end