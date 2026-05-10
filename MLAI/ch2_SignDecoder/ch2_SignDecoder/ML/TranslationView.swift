//
//  TranslationView.swift
//  ch2_SignDecoder
//
//  Created by nooy on 5/10/26.
//

import SwiftUI
import Translation // Translation 머신러닝 프레임워크


// TranslationView다른 뷰의 일부가 되므로 이 뷰에서는 이정도만 해두면 됨

struct TranslationView: View {
    var text: String
    var isProcessing: Bool
    @State private var showingTranslation = false
    
    
    var body: some View {
        Text("Identified Text")
            .font(.subheadline.bold())
            .textCase(.uppercase)
            .foregroundStyle(.indigo)
            .padding(.horizontal, 3)
            .background(.white.opacity(0.5))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
        
        
        
        
        Text(text)
            .frame(maxWidth: .infinity,
                   maxHeight: 100,
                   alignment: .topLeading)
            .padding()
            .background(Color(white: 0.9))
            .overlay { // 텍스트 인식 중일 때 띄울 화면
                if isProcessing {
                    ProgressView() // 기본 제공 뷰
                }
            }
        // machine translation~!!!
            .translationPresentation(isPresented: $showingTranslation, text: text)
        
        
        
        
        
        
        Button {
            showingTranslation = true
        } label: {
            Text("번역 레츠고")
                .padding(.horizontal, 5)
                .foregroundStyle(Color.white)
                .background(.indigo)
        }
        .disabled(text.isEmpty)
        .padding(.top)
        
        
    }
    
}

#Preview {
    TranslationView(text: "left lane must turn left", isProcessing: false)
}


#Preview("인식중일때") {
    TranslationView(text: "", isProcessing: true)
}
