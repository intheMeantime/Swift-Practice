//
//  MomentShapeView.swift
//  1.GratefulMoments
//
//  Created by nooy on 4/18/26.
//

import SwiftUI


struct MomentShapeView: View {
    var moment: Moment
    @State var layout: ShapeLayout = .standard // enum
    // 타임스탬프를 위한 위치 정보
    // 언어와 지역 정보를 모두 포함. 같은 언어라도 지역에 따라 서로 다른 규칙을 따를 수 있기 때문
    @Environment(\.locale) private var locale
    
    
    var body: some View {
        Shape(moment: moment, layout: layout) {
            shapeContent()
        }
    }
    
    
    private func shapeContent() -> some View {
        ZStack(alignment: .bottom) {
            if showImage {
                Color.clear
                contentStack()
                    .frame(height: layout.size)
                    .frame(maxWidth: layout.size / 2.5)
//                    .padding(.top,1)
                    .background(.ultraThinMaterial)
                
            } else {
                // Color.
                contentStack()
                    .frame(height: layout.size)
            }
            
            Text(moment.timestamp.formatted(
                .dateTime.locale(locale) // 날짜를 원하는 언어로 현지화
                    .month(.abbreviated).day()
            ))
            
            .font(.footnote)
//            .padding(.bottom, layout.size * 2)
            .frame(height: layout.size)
//            .frame(maxWidth: layout.size / 1)
            .frame(maxHeight: layout.timestampHeight)
        }
        .foregroundStyle(Color.white)
    }
    
    
    // 제목 표시하는 함수
    private func contentStack() -> some View {
        VStack(alignment: .center) {
            Text(moment.title)
                .font(layout.titleFont)
            
            if !moment.note.isEmpty, !showImage {
                Text(moment.note)
                    .font(layout.bodyFont)
            }
        }
        //        .frame(maxWidth: layout.size * 0.80)
        //        .frame(maxHeight: layout.size * (showImage ? 0.15 : 0.50))
        //        .padding(.bottom, layout.size * layout.textBottomPadding)
        .fixedSize(horizontal: false, vertical: true)
    }
    
    
    // 이미지가 있는지 체크하는 프로퍼티
    private var showImage: Bool {
        moment.image != nil
    }
    
    
    
    
}



#Preview {
    ScrollView {
        MomentShapeView(moment: Moment.imageSample)
        MomentShapeView(moment: Moment.imageSample, layout: .large)
        MomentShapeView(moment: Moment.sample)
        MomentShapeView(moment: Moment.sample, layout: .large)
    }
}
