//
//  Shape.swift
//  1.GratefulMoments
//
//  Created by nooy on 4/18/26.
//

import SwiftUI

// 어떤 뷰든 받을 수 있도록 제네릭 타입 추가
// Content: View → 어떤 SwiftUI View든 받을 수 있음

//  단순한 고정 뷰가 아니라, {} 안에 원하는 뷰를 넣을 수 있는 ‘컨테이너 뷰’로 바꾸기! 아대박.
// VStack 이런 컨테이너 뷰를 만드는 것임!

struct Shape<Content: View>: View {
    private let borderWidth = 2.0
    
    var moment: Moment? = nil
    var layout: ShapeLayout = .large
    var borderColor: Color = .accent
    
    @ViewBuilder var content: () -> Content
    
    
    
    var body: some View {
        ZStack{
            if let background = moment?.image {
                Image(uiImage: background)
                    .resizable()
                    .scaledToFit()
            }
            content()
                .frame(width: layout.size, height: layout.size)
        }
        .mask {
            Image(systemName: "heart.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: layout.size, height: layout.size)
        }
        .background{
            Image(systemName: "heart.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:layout.size, height:layout.size)
                .foregroundStyle(.blueberry)
        }
        .frame(width: layout.size, height: layout.size)
    }
}



#Preview {
    Shape(moment: Moment.imageSample){
        Text(Moment.imageSample.title)
            .foregroundStyle(Color.white)
    }
    .sampleDataContainer()
}
