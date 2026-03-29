//
//  FeatureCard.swift
//  3.OnboardingFlow
//
//  Created by nooy on 3/29/26.
//

import SwiftUI

struct FeatureCard: View {
    let iconName: String
    let description: String
    
    
    var body: some View {
        HStack {
            
            Image(systemName: iconName)
                .font(.largeTitle)
                // 이미지 사이즈 똑같게 지정 (.frame)
                .frame(width:50)
                .padding(.horizontal, 5)
                .foregroundStyle(Color(.red))
            
            Text(description)
                .fontWidth(.condensed)
            Spacer()
            
        }
        .padding(5)
//        .background(.tint, in: RoundedRectangle(cornerRadius: 12))
        .foregroundStyle(.white)
        .padding(.horizontal, 15)
    }
}

#Preview {
    FeatureCard(iconName: "pencil.circle", description: "이것은 연필일 수도 있고 연필이 아닐 수도 있다는 사실은 알 수 없지만, 너는 연필이라고 생각하고 있다고 생각해봐.")
}
