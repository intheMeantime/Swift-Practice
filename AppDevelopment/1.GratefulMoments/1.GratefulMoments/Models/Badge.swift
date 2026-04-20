//
//  Badge.swift
//  1.GratefulMoments
//
//  Created by nooy on 4/20/26.
//

import Foundation
import SwiftData

/// Use `timestamp` to determine if a badge is unlocked.
/// A `Moment` may be deleted but the timestamp stays.
/// Once awarded, badges aren't relocked.
@Model
class Badge {
    var details: BadgeDetails
    var moment: Moment? // 배지와 배지를 획득한 순간 사이의 관계를 만들기 위해 추가!
    var timestamp: Date?
    
    
    init(details: BadgeDetails) {
        self.details = details
        self.moment = nil
        self.timestamp = nil
    }
    
}

// BadgeDetailView(badge: .sample) 밖에서 이렇게 불러올 수 있게됨..
extension Badge {
    static var sample: Badge {
        let badge = Badge(details: .firstEntry)
        badge.timestamp = .now
        return badge
    }
}




