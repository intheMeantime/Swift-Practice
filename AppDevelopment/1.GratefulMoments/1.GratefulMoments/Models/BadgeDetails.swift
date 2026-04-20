//
//  BadgeDetails.swift
//  1.GratefulMoments
//
//  Created by nooy on 4/20/26.
//

import Foundation
import SwiftUI

// BadgeDetails에 Int 타입의 원시 값을 지정 / 나중에 모델을 저장할 수 있도록 Codable / 코드의 다른 부분에서 모든 케이스에 접근할 수 있도록 CaseIterable.

enum BadgeDetails: Int, Codable, CaseIterable {
    case firstEntry
    case fiveStars
    case shutterbug
    case expressive
    case perfectTen
    
    

    var requirements: String {
        switch self {
        case .firstEntry:
            return "첫 기억 기록하기"
        case .fiveStars:
            return "다섯개의 기억 기록하기"
        case .shutterbug:
            return "사진을 세 개 기록하기"
        case .expressive:
            return "사진과 텍스트가 담긴 다섯개의 기억"
        case .perfectTen:
            return "적어도 10개의 순간을 기록하고, 그 과정에서 다른 모든 배지도 함께 모으세요."
        }
    }
    
    
    var title: String {
        switch self {
        case .firstEntry:
            return "Start the Journey"
        case .fiveStars:
            return "5 Stars"
        case .shutterbug:
            return "Shutterbug"
        case .expressive:
            return "Expressive"
        case .perfectTen:
            return "Perfect 10"
        }
    }
    
    
    // badge.details.image 이렇게 접근하게 됨..
    var image: ImageResource {
        switch self {
        case .firstEntry:
            return .firstEntryUnlocked
        case .fiveStars:
            return .fiveStarsUnlocked
        case .shutterbug:
            return .shutterbugUnlocked
        case .expressive:
            return .expressiveUnlocked
        case .perfectTen:
            return .perfectTenUnlocked
        }
    }


    var lockedImage: ImageResource {
        switch self {
        case .firstEntry:
            return .firstEntryLocked
        case .fiveStars:
            return .fiveStarsLocked
        case .shutterbug:
            return .shutterbugLocked
        case .expressive:
            return .expressiveLocked
        case .perfectTen:
            return .perfectTenLocked
        }
    }
    
    var color: Color {
            switch self {
            case .firstEntry:
                return .ember
            case .fiveStars:
                return .cherry
            case .shutterbug:
                return .blueberry
            case .expressive:
                return .ocean
            case .perfectTen:
                return .ember
            }
        }
    
    
    var congratulationMessage: String {
        switch self {
        case .firstEntry:
            return "첫 기억을 기록"
        case .fiveStars:
            return "다섯개의 기억을 기록!"
        case .shutterbug:
            return "사진을 세 개를 기록!"
        case .expressive:
            return "사진과 텍스트가 담긴 다섯개의 기억을 기록!"
        case .perfectTen:
            return "잘하고계십니다"
        }
    }
    
}
