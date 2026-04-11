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
    
    @State private var scoreboard = Scoreboard()
    
    // 위에 스코어보드에서 players를 트래킹하기 때문에 밑에는 필요가 없음
//    @State private var players: [Player] = [
//        Player(name: "nooy", score: 0),
//        Player(name: "yoon", score: 0),
//        Player(name: "david", score: 0)
//    ]
    
    @State private var startingPoints = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Image(systemName: "cylinder.split.1x2")
                Text("Score Keeper")
            }
            .font(.title)
            .fontWeight(.heavy)
            .foregroundStyle(Color(.accent))
            .padding(.bottom, 20)
            
            
            SettingView(startPoints: $startingPoints, doesHighestScoreWin: $scoreboard.doesHighestScoreWin)
                .disabled(scoreboard.state != .setup)
            // 셋업 상태가 아니면 규칙은 disable 시킴!
            
            
            
            
            // Grid: 전체 표(테이블) 같은 컨테이너
            Grid {
                GridRow {
                    Text("[Player]")
                        .gridColumnAlignment(.leading)
                    Text("[Score]")
                        .opacity(scoreboard.state == .setup ? 0 : 1.0)
                    Text("")
//                    Text("??")
                }
                .font(.headline)
                
                // The $ prefix lets you use a binding to each player in the array. 배열을 $바인딩해서 ForEach로 보여줌
                ForEach($scoreboard.players) { $player in
                    GridRow { // 그리드의 행으로 정렬
                        HStack{
                            // 1등인 사람한테 왕관 이모지 넣어줌 (상태 바뀔때마다 실시간으로 바뀜)
                            if scoreboard.winners.contains(player) {
                                Image(systemName: "crown.fill")
                                    .foregroundStyle(Color.yellow)
                            }
                            TextField("Name", text: $player.name)
                                .disabled(scoreboard.state != .setup)
                                // 입력할 수 없게만 만듦
                        }
                        
                        // 점수 표시
                        Text("\(player.score)")
                            .opacity(scoreboard.state == .setup ? 0 : 1.0)
                        // 점수 스탭퍼
                        Stepper("\(player.score)", value: $player.score)
                            .labelsHidden() // 레이블 숨기고 그냥 Text로
                            .opacity(scoreboard.state == .setup ? 0 : 1.0)
                    }
                }
            }
            .padding(.vertical)
            
            Button("Add Player", systemImage: "plus") {
                scoreboard.players.append(Player(name:"", score:0))
            }
                .opacity(scoreboard.state == .setup ? 1.0 : 0)
            
            Spacer()
            
            
            HStack {
                Spacer()
                // 게임 진행 상태에 따라 버튼을 바꿔줌
                switch scoreboard.state {
                case .setup:
                    Button("Start Game", systemImage: "play") {
                        scoreboard.state = .playing
                        scoreboard.resetScore(to: startingPoints)
                    }
                case .playing:
                    Button("게임 종료하기", systemImage: "stop.fill") {
                        scoreboard.state = .gameOver
                    }
                case .gameOver:
                    Button("리셋 처음부터~", systemImage: "arrow.counterclockwise"){
                        scoreboard.state = .setup
                        scoreboard.resetScore(to: startingPoints)
                    }
                    //            default:
                    //                EmptyView()
                }
                Spacer()
            }
            .buttonStyle(.glassProminent)
            .buttonBorderShape(.capsule)
            .controlSize(ControlSize.large)
//            .tint(.accentColor)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
