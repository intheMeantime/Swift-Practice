//
//  DiceView.swift
//  4.DiceRoller
//
//  Created by nooy on 3/30/26.
//

import SwiftUI

struct DiceView: View {
    @State private var diceface: Int = 1
    // @State
    // SwiftUI는 기본적으로 변수가 바뀌는 걸 모니터링하지 않음.
    // 따라서 @State를 붙여줌으로써 변수가 바뀌는 모니터링하면서
    // 값이 바뀌면 view를 바로바로 업데이트하도록 함!!!
    
    // private
    // 뷰의 상태(State)는 그 뷰의 소유임.
    // 따라서 private 라고 해줌으로써 다른뷰에서 간섭하지 못하도록 설정
    
    var body: some View {
        VStack {
            Image(systemName: "die.face.\(diceface)")
                .resizable() // 사용 가능한 >모든< 공간을 채우게 함
                .frame(maxWidth:100, maxHeight:100)
                .aspectRatio(1, contentMode: .fit)
                .foregroundStyle(.gray, .brown)
                
            
            Button("Roll") {
                withAnimation { // 애니메이션 적용 !
                    diceface = Int.random(in: 1...6)
                }
            }
//            .buttonStyle(.glassProminent)
            .padding(5)
            .padding(.horizontal, 5)
            .background(
                .brown.opacity(0.5), in:RoundedRectangle(cornerRadius: 16))
            .foregroundStyle(.black.opacity(0.7))
            .fontWeight(.light)
        }
    }
}

#Preview {
    DiceView()
}
