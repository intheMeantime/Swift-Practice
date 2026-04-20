//
//  StreakCalculator.swift
//  1.GratefulMoments
//
//  Created by nooy on 4/20/26.
//

import Foundation

struct StreakCalculator {
    let calendar = Calendar.current

    /// 모멘트 배열을 기반으로 연속 기록 일수 계산
    func calculateStreak(for moments: [Moment]) -> Int {
        let startOfToday = calendar.startOfDay(for: .now)
        let endOfToday = calendar.date(byAdding: DateComponents(day: 1, second: -1), to: startOfToday)!

        
        // Ex. [0, 0, 1, 2, 4, 5]
        let daysAgoArray = moments
            .reversed()
            .map(\.timestamp)
            .map { calendar.dateComponents([.day], from: $0, to: endOfToday) } // 이 기록이 며칠 전인지 계산
            .compactMap { $0.day }
        
        
        var streak = 0
        for daysAgo in daysAgoArray {
            if daysAgo == streak {
                streak += 1
            }

        }

        
        return streak
    }
    
    
    
    
}
