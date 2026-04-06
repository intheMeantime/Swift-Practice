//
//  ContentView.swift
//  1.ScoreKeeper
//
//  Created by nooy on 4/6/26.
//

import SwiftUI

struct ContentView: View {
//    @State private var players: [String] = ["nooy", "yoon", "david"]
//    @State private var scores: [Int] = [0, 0, 0]
//    var body: some View {
//        VStack {
//            ForEach(0..<players.count, id: \.description) { index in
//                TextField("Name", text: $players[index])
//                Stepper("\(scores[index])", value: $scores[index])
//            }
//            Button("Add Player", systemImage: "plus") {
//                players.append("")
//                scores.append(0)
//            }
//            
//            Spacer()
//            
//        }
    
    @State private var players: [Player] = [
        Player(name: "nooy", score: 0),
        Player(name: "yoon", score: 0),
        Player(name: "david", score: 0)
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Score Keeper")
                .font(.title)
                .fontWeight(.heavy)
                .padding(.bottom, 20)
            
            // Grid: 전체 표(테이블) 같은 컨테이너
            Grid {
                GridRow {
                    Text("Player")
                        .gridColumnAlignment(.leading)
                    Text("Score")
                    Text("")
//                    Text("??")
                }
                .font(.headline)
                
                // The $ prefix lets you use a binding to each player in the array. 배열을 $바인딩해서 ForEach로 보여줌
                ForEach($players) { $player in
                    GridRow { // 그리드의 행으로 정렬
                        TextField("Name", text: $player.name)
                            .
                        Text("\(player.score)")
                        Stepper("\(player.score)", value: $player.score)
                            .labelsHidden() // 레이블 숨기고 그냥 Text로
                    }
                }
            }
            .padding(.vertical)
            
            Button("Add Player", systemImage: "plus") {
                players.append(Player(name:"", score:0))
            }
            
            Spacer()
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
