//
//  ContentView.swift
//  Memorize
//
//  Created by 鄭勝偉 on 2023/6/18.
//

import SwiftUI

struct ContentView: View {
    @State var emojis0 = ["😘", "😎","🥳","😡","🥲","😍","😚","😶‍🌫️","🤢","🤓","😇","🥵","🫣"]
    @State var emojis1 = ["🚗", "🚕","🚙","🚌","🚎","🏎️","🚓","🚑","🚒","🚐","🛻","🚚","🚜"]
    @State var emojis2 = ["🐶", "🐱","🐭","🐹","🦊","🐻","🐼","🐨","🐯","🦁","🐮","🐷","🐸"]
//    no datatype needed let swift figure it out
//    or use array<String> or [String]
    
    func pickTheme(_ theme:Int) ->[String]{
        switch theme {
        case 0:
            return emojis0
        case 1:
            return emojis1
        case 2:
            return emojis2
        default:
            return emojis0
        }
    }
    
    @State var themeNo :Int = 0
    @State var maxCardNum : Int = 13
    var body: some View {
        VStack{
            Text("Memorize!")
                .font(.largeTitle)
                .fontWeight(.bold)

            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]){
                    ForEach(pickTheme(themeNo)[0..<maxCardNum], id: \.self) { emoji in
                        CardView(content:emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .foregroundColor(.pink)
            }
            .bold()
        
            Spacer()
            HStack{
                Spacer(minLength: 10)
                theme0
                Spacer()
                theme1
                Spacer()
                theme2
                Spacer(minLength: 10)
                
            }
            .padding(.horizontal)
            .font(.largeTitle)
            .foregroundColor(.blue)
            
        }
        .padding(.horizontal)

        
    }
//    same as add but more tidy
    var theme0: some View{
        Button(action: {
            emojis0.shuffle()
            themeNo = 0
            maxCardNum = Int.random(in: 4...13)
        }, label: {VStack{
            Image(systemName:"face.smiling.inverse")
            Text("Faces")
                .font(.body)
            }})
    }
    var theme1 : some View{
        Button(action: {
            emojis1.shuffle()
            themeNo = 1
            maxCardNum = Int.random(in: 4...13)
            
        }, label: {VStack{
            Image(systemName:"car.fill")
            Text("Vehicles")
                .font(.body)
            }})
    }
    var theme2 : some View{
        Button(action: {
            emojis2.shuffle()
            themeNo = 2
            maxCardNum = Int.random(in: 4...13)

        }, label: {VStack{
            Image(systemName:"heart.fill")
            Text("Animals")
                .font(.body)
            }})
    }
}


struct CardView: View{
    //@state means this variable is stored elsewhere and this is just a pointer
    @State var isFaceUp :Bool = true
    var content : String
    
    var body: some View{
        ZStack(alignment: .center){
            let shape = RoundedRectangle(cornerRadius: 25.0)
            if isFaceUp{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            }
            else{
                RoundedRectangle(cornerRadius: 25.0)
                    .fill()
            }
        }
        .onTapGesture{
            isFaceUp = !isFaceUp
        }
    }
}































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
            
    }
}
