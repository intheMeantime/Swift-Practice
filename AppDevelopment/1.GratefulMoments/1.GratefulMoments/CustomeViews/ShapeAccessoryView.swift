//
//  ShapeAccessoryView.swift
//  1.GratefulMoments
//
//  Created by nooy on 4/20/26.
//

import SwiftUI
import SwiftData

struct ShapeAccessoryView: View {
    let moment: Moment
    let shapeLayout: ShapeLayout
    
    
    var body: some View {
        NavigationLink {
            if badges.count == 1 {
                BadgeDetailView(badge: badges[0])
            } else {
                MomentDetailView(moment: moment)
            }
        } label: {
            badgeView
        }
    }


    private var badgeView: some View {
        Group {
            if badges.count > 1 {
                Text("+\(badges.count)")
                    .bold()
                    .minimumScaleFactor(0.3)
                    .frame(width: size * 0.5, height: size * 0.5)
                    .padding(8)
                    .background {
                        Image("Blank")
                            .resizable()
                            .frame(width: size, height: size)
                            .shadow(radius: 2)
                    }
                    .foregroundStyle(.gray)
                
                
            } else if let badge = badges.first {
                Image(badge.details.image)
                    .resizable()
                    .frame(width: size, height: size)
                    .shadow(radius: 2)
            }
        }
        .offset(y: yOffset)
    }
    
    
    // 위치 계산 함수
    private var yOffset: CGFloat {
        let radius = shapeLayout.size / 2
        // 30 degrees points to the top right corner of a hexagon
        let yOffsetFromHexagonCenter = sin(Angle.degrees(30).radians) * radius
        return radius - yOffsetFromHexagonCenter - (size / 2)
    }

    
    private var badges: [Badge] {
        moment.badges
    }
    
    
    
    private var size: CGFloat {
        shapeLayout.size / 5
    }
    
    
    
    
}

#Preview("Single badge") {
    ShapeAccessoryView(moment: .sample, shapeLayout: .large)
        .sampleDataContainer()
}

#Preview("Multiple badges") {
    ShapeAccessoryView(moment: .imageSample, shapeLayout: .standard)
        .dynamicTypeSize(.large)
        .sampleDataContainer()
}

//#Preview("badges222") {
//    ShapeAccessoryView(moment: .imageSample, layout: .standard)
//        .dynamicTypeSize(.large)
//        .sampleDataContainer()
//}
