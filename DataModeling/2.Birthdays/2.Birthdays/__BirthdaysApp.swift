//
//  __BirthdaysApp.swift
//  2.Birthdays
//
//  Created by nooy on 4/12/26.
//

import SwiftUI
import SwiftData

@main
struct __BirthdaysApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
            // 컨테이너: Friend 데이터가 저장되는 곳과 화면에 표시되는 ContentView 사이에서 동작하는 일종의 번역기와 같음.
            // Friend.self는 특정 Friend 인스턴스가 아니라 Friend라는 타입 자체를 참조
            // 컨테이너는 이 타입 설계도를 사용하여 모델이 어떻게 저장되어야 하는지를 이해함.
        }
    }
}
