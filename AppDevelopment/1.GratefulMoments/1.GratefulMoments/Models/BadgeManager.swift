//
//  BadgeManager.swift
//  1.GratefulMoments
//
//  Created by nooy on 4/20/26.
//

import Foundation
import SwiftData

class BadgeManager {
    private let modelContainer: ModelContainer
    
    init(modelContainer: ModelContainer) {
        self.modelContainer = modelContainer
    }
    
    
    
    
    
    func unlockBadge(newMoment: Moment) throws { // 파라미터로 모멘트를 받아오네..
        // 저장된 모든 항목을 가져온다
        let context = modelContainer.mainContext
        let moments = try context.fetch(FetchDescriptor<Moment>())
        // 타임스탬프가 없는 뱃지 == 잠긴 뱃지로 생각하고 필터링!
        let lockedBadges = try context.fetch(FetchDescriptor<Badge>(predicate: #Predicate { $0.timestamp == nil }))
        
        // 잠금 해제 조건 설정
        var newlyUnlocked: [Badge] = []
        
        for badge in lockedBadges {
            switch badge.details {
            case .firstEntry where moments.count >= 1,
                .fiveStars where moments.count >= 5,
                .shutterbug where moments.count(where: {$0.image != nil }) >= 3,
                .expressive where moments.count(where: { $0.image != nil && !$0.note.isEmpty }) >= 5,
                .perfectTen where moments.count >= 10 && lockedBadges.count == 1:
            
                newlyUnlocked.append(badge)
                
            default:
                continue
            }
        }
        
        // 뱃지 잠금 해제
        for badge in newlyUnlocked {
            badge.moment = newMoment
            badge.timestamp = newMoment.timestamp
        }
        
    }
    
    
    
    
    
    // throws: 이 함수 안에서 에러가 발생할 수 있음
    func loadBadgesIfNeeded() throws {
        let context = modelContainer.mainContext
        
        // 뱃지가 로드되어 있는지 확인
        var fetchDescriptor = FetchDescriptor<Badge>() // FetchDescriptor<Badge>(): SQL의 SELECT 문 같은 역할 (조회 조건)
        fetchDescriptor.fetchLimit = 1
        let existingBadges = try context.fetch(fetchDescriptor) // 위에서 만든 조건대로 실제 데이터를 가져와라
        
        // 로드 안 되어 있으면? insert 하쇼.
        if existingBadges.isEmpty {
            for details in BadgeDetails.allCases {
                context.insert(Badge(details: details))
            }
        }
        
    }
    
}
