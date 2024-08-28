class NPC
    attr_accessor :NPC_hand
    def initialize
        @number = [1,1,2,2,3,3] #1がグー2がチョキ3がパー
        @fight = Fight.new
        @fight.fighting #勝敗結果が書いてる

        @NPC_hand = ""
    end   
    def randamu

        random_element = number.sample #random_elementがグーチョキパー
        

        if random_element == 1
            index1 = number.index1(1)
            number.delete_at(index1) if index1
            
            @NPC_hand = "gu-"
        end

        if random_element == 2
            index2 = number.index2(2)                
            number.delete_at(index2) if index2

            @NPC_hand = "tyoki"
        end
            
        if random_element == 3
            index3 = number.index3(3)
            number.delete_at(index3) if index3

            @NPC_hand = "pa-"
        end    
    




