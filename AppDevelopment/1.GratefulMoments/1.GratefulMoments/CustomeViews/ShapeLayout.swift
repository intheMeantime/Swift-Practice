//
//  ShapeLayout.swift
//  1.GratefulMoments
//
//  Created by nooy on 4/18/26.
//

import Foundation
import SwiftUI

// 사이즈도 미리 enum 으로 케이스 만들어두기!
enum ShapeLayout {
    case standard
    case large
    
    var size: CGFloat {
        switch self {
            
        case .standard:
            return 180.0
            
        case .large:
            return 280.0
        }
    }
    
    // 뷰의 위치 관련
    // 이런 애들도 enum에 넣네..
    var timestampBottomPadding: CGFloat {
        0.08
    }

    var textBottomPadding: CGFloat {
        0.25
    }

    var timestampHeight: CGFloat {
        size * (0.7)
    }
    
    
    
    // 폰트 사이즈 이넘
    var titleFont: Font {
        switch self {
        case .standard:
            return .headline
        case .large:
            return .title3.bold()
        }
    }

    var bodyFont: Font {
        switch self {
        case .standard:
            return .caption2
        case .large:
            return .body
        }
    }
    
    
    
    
    
}
