//
//  AchievementsView.swift
//  1.GratefulMoments
//
//  Created by nooy on 4/20/26.
//

import SwiftUI
import SwiftData

struct AchievementsView: View {
    @Query(filter: #Predicate<Badge> {$0.timestamp != nil }) private var unlockedBadges: [Badge]
    
    @Query(filter: #Predicate<Badge> {$0.timestamp == nil }) private var lockedBadges: [Badge]
    
    @Query(sort: \Moment.timestamp) private var moments: [Moment]

    let GradientColors: [Color] = [.appBackgroundTop, .appBackgroundBottom,]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                contentStack
            }
            .navigationTitle(Text("기록기억기"))
            .background(Gradient(colors: GradientColors))
        }
        // xxxlarge 사이즈까지만 제한
        .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
    }
    
    
    
    
    
    
    
    
    private var contentStack: some View {
        VStack(alignment: .leading) {
            StreakView(numberOfDays: StreakCalculator().calculateStreak(for: moments))
                .frame(maxWidth: .infinity)
            if !unlockedBadges.isEmpty {
                
                header("~내 뱃지~~")
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(sortedUnlockedBadges) { badge in
                            //Text(badge.details.title)
                            UnlockedBadgeView(badge: badge)
                        }
                    }
                }
                .scrollClipDisabled()
                .scrollIndicators(.hidden)
            }
            
            if !lockedBadges.isEmpty {
                header("~잠긴 뱃지~~")
                ForEach(sortedLockedBadges) { badge in
                    // Text(badge.details.title)}
                    LockedBadgeView(badge: badge)
                }
            }
        }
        
        .padding()
        .frame(maxWidth: .infinity)
        
    }
    
    
    
    
    func header(_ text: String) -> some View {
        Text(text)
            .font(.subheadline.bold())
            .padding()
    }
    
    
    
    
    
    /// - precondition: `unlockedBadges` must have a timestamp
    private var sortedUnlockedBadges: [Badge] {
        unlockedBadges.sorted {
            ($0.timestamp!, $0.details.title) < ($1.timestamp!, $1.details.title)
        }
    }
    
    
    
    private var sortedLockedBadges: [Badge] {
        lockedBadges.sorted {
            $0.details.rawValue < $1.details.rawValue
        }
    }
    
    
    
    
    
    
    
    
}

#Preview {
    AchievementsView()
        .sampleDataContainer()
}
