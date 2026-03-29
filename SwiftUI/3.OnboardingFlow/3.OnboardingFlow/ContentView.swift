//
//  ContentView.swift
//  3.OnboardingFlow
//
//  Created by nooy on 3/28/26.
//

import SwiftUI

// Assets에서 만들어둔 컬러로 global property 만들기
let GradientColors: [Color] = [.gradientBottom,.gradientBottom,.gradientTop]



struct ContentView: View {
    var body: some View {
        TabView {
            WelcomePage()
            FeaturePage()
        }
        // 이런식으로 그래디언트 컬러 넣을 수 있음!
        .background(Gradient(colors: GradientColors))
        .tabViewStyle(.page)
        
        // 여기에서 foregroundStyle을 적용하면
        // 하위뷰에서 foregroundStyle이 적용되어있지 않은 요소들에 모두 적용됨
        .foregroundStyle(.white)        
        
    }
}

#Preview {
    ContentView()
}
