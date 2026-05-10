//
//  ContentView.swift
//  ch2_SignDecoder
//
//  Created by nooy on 5/10/26.
//

import SwiftUI


// 여기에 NavigationStack으로 감싸주어야 네비가 작동하기 시작함
struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Tap to select a sign to translate")
                    .font(.headline)
                    .padding(10)
                
                ImageGalleryView()
                Spacer()
            }
            .trailTheme()
            .navigationTitle("Sign Decoder")
        }
    }
}

#Preview {
    ContentView()
}
