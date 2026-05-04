//
//  StreakView.swift
//  1.GratefulMoments
//
//  Created by nooy on 4/20/26.
//

import SwiftUI

struct StreakView: View {
    var numberOfDays: Int
    
    
    var body: some View {
        Shape(borderColor: .secondary) { // 만들어둔 모양 가져옴
            VStack(spacing: 0){
                Text("Streak \(Image(systemName: "flame.fill"))")
                    .foregroundStyle(.ember)
                Text(attributedText)
                    .multilineTextAlignment(.center)
                
                
//                Text("\(numberOfDays)")
//                    .font(.system(size:70))
//                Text("Days")
            }
            .font(.callout)
            
        }
    }
    
    var attributedText: AttributedString {
        // Localized 문자열은 자동 문법 일치를 사용해 다양한 언어에 맞게 표현
        var attributedString = AttributedString(localized: "^[\(numberOfDays) \nDays](inflect: true)")
        
        // 숫자
        if let range = attributedString.range(of: "\(numberOfDays)") {
            attributedString[range].font = .system(size: 70)
        }
        return attributedString
    }
    
}

#Preview {
    StreakView(numberOfDays: 0)
    StreakView(numberOfDays: 1)
    StreakView(numberOfDays: 23)
}
