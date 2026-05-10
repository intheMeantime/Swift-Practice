//
//  TextRecognitionView.swift
//  ch2_SignDecoder
//
//  Created by nooy on 5/10/26.
//

import SwiftUI
import Vision

struct TextRecognitionView: View {
    let imageResource: ImageResource
    let boundingColor = Color(red: 1.00, green: 0.00, blue: 0.05)
    
    @State private var textRecognizer: TextRecognizer?
    
    
    
    var body: some View {
        VStack {
            Image(imageResource)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .task { // .task는 내부적으로 async context(비동기)를 제공함. --> on Appear은 안됨
                    textRecognizer = await TextRecognizer(imageResource: imageResource)
                }
                .overlay {
                    if let observations = textRecognizer?.observations {
                        ForEach(observations, id: \.uuid) { observation in
                            BoundsRect(normalizedRect: observation.boundingBox)
                                .stroke(boundingColor, lineWidth: 3)
                        }
                        
                    }
                }
            Spacer()
            
            TranslationView(text: textRecognizer?.recognizedText ?? "", isProcessing: isProcessing)
            //                .background(Color.red)
        }
        .padding()
        .trailTheme()
        .navigationTitle("Sign Info")
    }
    
    
    
    
    // 인식 중일 때 띄울 화면 제어
    private var isProcessing: Bool {
           textRecognizer == nil
       }
}



#Preview {
    NavigationStack {
        TextRecognitionView(imageResource: .sign1)
        //            .navigationBarTitleDisplayMode(.inline)
    }
}
