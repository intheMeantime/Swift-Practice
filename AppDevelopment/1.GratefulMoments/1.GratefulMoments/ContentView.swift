//
//  ContentView.swift
//  1.GratefulMoments
//
//  Created by nooy on 4/16/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    
    var body: some View {
        
        TabView {
            Tab("기억", image: "MomentsTab") {
                MomentsView()
            }
            
            Tab("와우", systemImage: "medal") {
                AchievementsView()
            }
        }
    }
}


#Preview {
    ContentView()
        .sampleDataContainer()
}

#Preview("Dark") {
    ContentView()
        .sampleDataContainer()
        .preferredColorScheme(.dark)
}
