//
//  BadgeDetailView.swift
//  1.GratefulMoments
//
//  Created by nooy on 4/20/26.
//

import SwiftUI


struct BadgeDetailView: View {
    var badge: Badge
    
    
    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                Image(badge.details.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 140, height:140)
                Text(badge.details.title)
                    .font(.title.bold())
                Text(badge.details.congratulationMessage)
                    .font(.body)
                Spacer()
                if let timestamp = badge.timestamp {
                    Text(timestamp, style: .date)
                        .font(.caption.bold())
                }
            }
            .padding()
            .frame(width: 320)
            .frame(minHeight: 410)
            .fixedSize()
//            .frame(width:320, height:410)
            .multilineTextAlignment(.center)
            .foregroundStyle(.white)
            .background(badge.details.color.opacity(0.8))
            .clipShape(RoundedRectangle(cornerRadius: 16.0))
        }
        // 콘텐츠가 사용 가능한 공간에 맞을 경우에는 스크롤이 필요하지 않음. 콘텐츠가 넘칠 때만 스크롤되도록
        .scrollBounceBehavior(.basedOnSize)
        // 콘텐츠를 가운데로 배치
        .defaultScrollAnchor(.center, for: .alignment)
    }
}

#Preview {
    BadgeDetailView(badge: .sample)
}


#Preview("Spanish language") {
    BadgeDetailView(badge: .sample)
        .environment(\.locale, Locale(identifier: "es"))
}
