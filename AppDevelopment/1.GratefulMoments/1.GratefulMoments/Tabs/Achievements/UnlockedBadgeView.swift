//
//  UnlockedBadgeView.swift
//  1.GratefulMoments
//
//  Created by nooy on 4/20/26.
//

import SwiftUI
import SwiftData

struct UnlockedBadgeView: View {
    var badge: Badge
    
    let GradientColors: [Color] = [.appBackgroundTop, .appBackgroundBottom,]
    
    var body: some View {
        
        NavigationLink {
            BadgeDetailView(badge: badge)
            
        } label: {
            VStack(alignment: .leading, spacing: 8) {
                Image(badge.details.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70, height:70)
                    .frame(maxWidth: .infinity, alignment: .center)
                Text(badge.details.title)
                    .font(.headline.bold())
                Text(badge.details.requirements)
                    .font(.caption2.bold())
                Spacer()
                if let timestamp = badge.timestamp {
                    Text(timestamp, style: .date)
                        .font(.caption.bold())
                }
            }
            .padding()
            .frame(width: 210)
            .frame(minHeight: 225)
            // 글꼴 사이즈가 커져도 대비할 수 있게
            .fixedSize()
            .multilineTextAlignment(.leading)
            .foregroundStyle(.white)
            .background(badge.details.color.opacity(0.8))
            .clipShape(RoundedRectangle(cornerRadius: 16.0))
            
        }
        .background(Gradient(colors: GradientColors))
        
    }
    
}

#Preview {
    NavigationStack {
        UnlockedBadgeView(badge: .sample)
    }
}
