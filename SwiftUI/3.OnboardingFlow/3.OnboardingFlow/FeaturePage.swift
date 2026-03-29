//
//  FeaturePage.swift
//  3.OnboardingFlow
//
//  Created by nooy on 3/29/26.
//

import SwiftUI

struct FeaturePage: View {
    var body: some View {
        VStack(spacing: 15) {
            Text("Let's dream...")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.white.opacity(0.75))
                .padding(.bottom)
                .padding(.top, 30)
            
            
            FeatureCard(iconName: "cloud.moon", description: "Wake up after about 5–6 hours of sleep, stay awake for a short time, then go back to sleep.")
            
            FeatureCard(iconName: "zzz", description: "Once you realize you’re dreaming, stay calm. Getting too excited can wake you up.")
            

            
            Spacer()
        }
        .padding(5)
        
    }
}

#Preview {
    FeaturePage()
        .frame(maxHeight: .infinity)
        .background(Gradient(colors: GradientColors))
        // white forground가 ContentView에는 적용되는데, 여기 프리뷰에는 적용이 안되니까 여기도 적용해두기
        .foregroundStyle(.white)
}
