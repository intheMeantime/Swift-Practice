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
                .dateTime
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
