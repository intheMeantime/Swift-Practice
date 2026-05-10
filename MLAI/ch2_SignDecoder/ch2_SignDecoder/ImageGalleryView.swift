//
//  ImageGalleryView.swift
//  ch2_SignDecoder
//
//  Created by nooy on 5/10/26.
//

import SwiftUI

struct ImageGalleryView: View {
    let itemSize = 100.0
    
    let imageResources: [[ImageResource]] = [
        [.sign1, .sign2, .sign3],
        [.sign4, .sign5, .sign6],
        [.sign7, .sign8, .sign9]
    ]
    
    
    var body: some View {
        Grid {
            ForEach(imageResources, id: \.self) { resourceRow in // 각 row
                GridRow {
                    ForEach(resourceRow, id: \.self) { resource in // 각 Row의 아이템
                        
                        NavigationLink {
                            // 클릭하면 번역창으로 넘어가도록
                            TextRecognitionView(imageResource: resource)
                        } label: {
                            Image(resource)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: itemSize, height: itemSize)
                            // 모양대로 자르기
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .padding(1)
                        }
                    }
                    
                }
            }
            
        }
        .padding()
        .background(.white.opacity(0.3))
    }
}

#Preview {
    NavigationStack {
        ImageGalleryView()
    }
}
