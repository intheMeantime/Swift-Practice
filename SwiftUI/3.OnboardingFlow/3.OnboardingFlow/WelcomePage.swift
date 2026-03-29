//
//  WelcomePage.swift
//  3.OnboardingFlow
//
//  Created by nooy on 3/28/26.
//

import SwiftUI

struct WelcomePage: View {
    var body: some View {
        VStack {
            ZStack {
                
                // 도형의 기본 사이즈: 자동으로 화면을 다 채워버림
                RoundedRectangle(cornerRadius:30)
                // 도형 사이즈 조정하는 방법
                    .frame(width:130, height:130)
                    .foregroundStyle(.tint) // 강조 색상(tint)을 적용
                
                Image(systemName: "moon.zzz.fill")
                    .font(.system(size:70))
                    .foregroundStyle(Color.red)
            }
            
            
            Text("Welcome to nooy's App ")
            // .font 모디파이어가 Font 타입을 요구하기 때문에 그냥 .title 이라고만 입력해도 됨 (==타입추론)
                .font(Font.title)
                .fontWeight(.semibold)
            // .fontWidth(.condensed)
            // .fontDesign(.monospaced)
                // View의 기본 크기를 idel size 라고 함
                .padding(.top, 10)
//                .border(Color.black, width:1.5)
                
            
            Text("Stop(overoveroveroveroveroveroveroverover)Thin..\nk\ni\nng\n!\n.\n.")
                .font(.title2)
                // 길이가 길어져서 넘어가는 경우 정렬하기
                .multilineTextAlignment(.center)
                .foregroundStyle(Color.red)
//                .border(Color.yellow, width:1.5)
        }
//        .border(.red, width:1.5)
        .padding()
//        .border (.green, width:1.5)
    }
}

#Preview {
    WelcomePage()
}
