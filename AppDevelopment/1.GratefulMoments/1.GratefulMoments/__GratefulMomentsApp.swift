//
//  __GratefulMomentsApp.swift
//  1.GratefulMoments
//
//  Created by nooy on 4/16/26.
//

import SwiftUI
import SwiftData

@main
struct __GratefulMomentsApp: App {
    let dataContainer = DataContainer()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(dataContainer)
        }
        .modelContainer(dataContainer.modelContainer)
    }
}
