//
//  DataContainer.swift
//  1.GratefulMoments
//
//  Created by nooy on 4/18/26.
//

import Foundation
import SwiftData
import SwiftUI
import Observation

// 데이터 설정을 View에서 분리해서, 앱 전체에서 재사용 가능한 중앙 관리 클래스를 만들기

@Observable

@MainActor // 이 클래스는 무조건 메인 스레드에서만 실행되도록 함.
// 무거운 작업은 백그라운드에서 처리하고, 그 결과를 받아서 화면에 반영(UI)할 때만 메인 스레드로 돌아오는 구조임.
// 예를 들어 서버에서 이미지를 다운로드할 때는 백그라운드에서 받고, 다운로드가 끝나면 메인 스레드에서 이미지를 화면에 보여주는 식.

class DataContainer {
    // DB 전체를 관리하는 루트 객체
    let modelContainer: ModelContainer
    var badgeManager: BadgeManager
    
    // 자주 쓰니까 편하게 꺼내기 위해서 만듦!
    // 도서관 사서 역할
    var context: ModelContext {
        modelContainer.mainContext
    }
    
    
    init(includeSampleData: Bool = false) {
        // 어떤 모델(@Model)을 DB에 넣을지 정의해줌. (여러 개 가능)
        let schema = Schema([
            Moment.self,
            Badge.self,
        ])
        
        // 설정값들
        // isStoredInMemoryOnly: true --> 앱을 종료하면 데이터 사라짐!=테스트용 (실제 앱이면 false)
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: includeSampleData)
        
        do {
            // !!!!!!!!! SwiftData DB 생성!!!!!!!! -- 위에서 만들어둔 schema랑 config 를 넘겨줌!
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            badgeManager = BadgeManager(modelContainer: modelContainer)
            
            // 뱃지 로드하기
            // 이 메서드는 앱이 실행될 때마다 호출됨 - 있는지 체크하게 만들어뒀음
            try badgeManager.loadBadgesIfNeeded()
            
            
            // 초기에 기본으로 목데이터를 넣어주기 (여기서는 샘플 느낌)
            if includeSampleData {
                try loadSampleMoment()
            }
            
            try context.save()
            
        } catch {
            fatalError("모델 컨테이너를 만들 수 없음: \(error)")
        }
        
    }
    
    
    
    
    
    private func loadSampleMoment() throws {
        for moment in Moment.sampleData {
            context.insert(moment)
            try badgeManager.unlockBadge(newMoment: moment)
        }
    }
    
    
    
}






private let sampleContainer = DataContainer(includeSampleData: true)

// 모든 View에서 쓸 수 있는 커스텀 modifier를 정의
// 샘플 데이터가 들어있는 >>SwiftData 환경 + 커스텀 데이터 컨테이너<< 를 View에 한 번에 주입하는 modifier
extension View {
    
    func sampleDataContainer() -> some View {
        self
            // DataContainer를 환경(Environment) 으로 내려보냄 (내가 만든 DataContainer 자체 접근)
            .environment(sampleContainer)
            // SwiftData에게 “이 컨테이너를 써라”라고 알려줌 (SwiftData의 도서관 지정 .(?))
            .modelContainer(sampleContainer.modelContainer)
    }
}
