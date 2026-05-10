//
//  TrailTheme.swift
//  ch2_SignDecoder
//
//  Created by nooy on 5/10/26.
//

import Foundation
import SwiftUI


// ViewModifier 프로토콜을 사용하면
// .frame 같은 기본 수정자(modifier)와 유사한 사용자 정의 수정자를 만들 수 있다
struct TrailTheme: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            VStack {
                Image(.background)
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxHeight: .infinity, alignment: .top)
                Image(.background)
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxHeight: .infinity, alignment: .top)
//                Spacer()
//                Image(.background)
//                    .resizable()
//                    .edgesIgnoringSafeArea(.all)
//                    .frame(maxHeight: .infinity, alignment: .bottom)
                
            }
            content
        }
    }
}


extension View {
    func trailTheme() -> some View {
        modifier(TrailTheme())
    }
}
