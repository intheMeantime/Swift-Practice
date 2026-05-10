//
//  BoundsRect.swift
//  ch2_SignDecoder
//
//  Created by nooy on 5/10/26.
//

import Foundation
import SwiftUI
import Vision


struct BoundsRect: Shape {
    // NormalizedRect는 고정 좌표 대신 비율(percentage)로 크기와 위치를 정의하는 사각형
    // 이를 사용하면 이미지가 어떤 크기로 스케일되더라도 텍스트 영역(bounds)을 정확하게 표현할 수 있다. (e.g., 왼쪽에서 20%
    let normalizedRect: NormalizedRect
    // 정규화된(Rect normalized) 사각형 저장 (x, y, width, height)
    
    func path(in rect: CGRect) -> Path {
        // normalized 좌표 → 실제 이미지 좌표로 변환
        let imageCoordinatesRect = normalizedRect.toImageCoordinates(rect.size, origin: .upperLeft)
        
        // 변환된 실제 좌표 사각형으로 SwiftUI Path 생성
        return Path(imageCoordinatesRect)
    }
    
}
