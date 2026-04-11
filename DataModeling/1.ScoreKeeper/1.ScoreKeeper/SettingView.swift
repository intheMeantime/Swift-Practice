//
//  SettingView.swift
//  1.ScoreKeeper
//
//  Created by nooy on 4/10/26.
//

import SwiftUI

struct SettingView: View {
    // @Binding은 데이터를 직접 저장하는 대신, 다른 곳에 저장된 source of truth 과 property(속성)를 연결해주는 역할
    @Binding var startPoints: Int // 즉, 얘는 외부에서 파라미터로 받아와야함
    @Binding var doesHighestScoreWin: Bool
    
    
    var body: some View {
        VStack(alignment: .center) {
            Text("게임 규칙")
                .font(.headline)
            Divider()
            // 사용자가 선택하면 picker의 $바인딩이 해당 tag 값으로 업데이트됨!!!
            Picker("누가누가 이길까", selection: $doesHighestScoreWin) {
                Text("점수가 높은 사람이 승리")
                    .tag(true)
                Text("점수가 낮은 사람이 승리")
                    .tag(false)
            }
            Picker("부터 시작", selection: $startPoints) {
                Text("0")
                    .tag(0)
                Text("9999")
                    .tag(9999)
                Text("-9999")
                    .tag(-9999)
            }
            .pickerStyle(.palette)
//            .background(.red)
            
            
        }
        .padding()
        .border(Color.accent, width: 1.5)
    }
}

#Preview {
    @Previewable @State var doesHighestScoreWin = true
    @Previewable @State var startPoints: Int = 10
    SettingView(startPoints: $startPoints, doesHighestScoreWin: $doesHighestScoreWin)
}
