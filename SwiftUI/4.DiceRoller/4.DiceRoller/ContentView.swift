//
//  ContentView.swift
//  4.DiceRoller
//
//  Created by nooy on 3/30/26.
//

import SwiftUI

struct ContentView: View {
    @State private var numOfDice: Int = 5
    
    
    var body: some View {
        VStack {
            Text("Dice\n         Roller")
                .font(.system(size: 40).lowercaseSmallCaps())
                .foregroundStyle(.white.opacity(0.8))
                .fontWeight(.semibold)
            
            HStack{
                // for문 = 그냥 반복 실행 (로직용)
                // ForEach = SwiftUI에서 “뷰를 반복 생성” (UI용)
                
                ForEach(1...numOfDice, id: \.description) { _ in
                    DiceView()
                }
                
                // \.self : 값 자체를 id로 사용 (1,2,3)
                // \.description : 문자열로 바꿔서 id 사용 (“1”,“2”,“3”)
            } // end HStack
            
            HStack {
                // HStack 뷰는 필요하다면 화면의 경계를 넘어가더라도 항상 하위 뷰들이 요청한 크기를 그대로 제공함..
                Button("소멸", systemImage: "trash") {
                    withAnimation{
                        numOfDice -= 1
                    }
                }
                .disabled(numOfDice == 1)
                .labelStyle(.iconOnly)
                .font(.title2)
                .buttonStyle(.borderless)
                .padding()
                
                
                Button("ADD") {
                    withAnimation{
                        numOfDice += 1
                    }
                }
                .disabled(numOfDice==10)
                .buttonStyle(.borderless)
                .font(.title3)
            }
            .padding()
        }
        .padding()
        // .frame 모디파이어를 사용해서 배경이 전체에 적용(확장)되도록 조정
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.appBackground)
        // .tint 모디파이어는 accent color에 해당하는 뷰만 바꿔줌!!
        .tint(.white.opacity(0.5))
        
    }
    
}

#Preview {
    ContentView()
}
