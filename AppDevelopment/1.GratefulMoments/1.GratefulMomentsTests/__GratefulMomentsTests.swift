//
//  __GratefulMomentsTests.swift
//  1.GratefulMomentsTests
//
//  Created by nooy on 5/4/26.
//

import Testing
@testable import GratefulMoments
import Foundation

struct StreakCalculatorTests {
    let streakCalculator = StreakCalculator()
    let now = Date.now
    

    @Test func StreakCalculatorTests() {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        let days = [-2, -1]
        let expectedStreak = 2


//        let moments = [Moment]()
        let moments = days.map {
            let date = Calendar.current.date(byAdding: .day, value: $0, to: now)!
            return Moment(title: "", note: "", timestamp: date)
        }


        let streak = streakCalculator.calculateStreak(for: moments)
        #expect(streak == expectedStreak)
        
        
        
    }
    

}
