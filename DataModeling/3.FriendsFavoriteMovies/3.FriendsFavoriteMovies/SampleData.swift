//
//  SampleData.swift
//  3.FriendsFavoriteMovies
//
//  Created by nooy on 4/12/26.
//

import Foundation
import SwiftData


@MainActor
class SampleData {
    // SampleData 클래스의 공유 인스턴스를 생성
    // 이 프로퍼티에 접근하려면 SampleData.shared라고 작성하면 됨
    static let shared = SampleData()
    
    let modelContainer: ModelContainer
    
    var context: ModelContext {
        modelContainer.mainContext
    }
    
    var friend: Friend {
        Friend.sampleData.first!
    }
    var movie: Movie {
        Movie.sampleData.first!
    }
    
    
    
    // 초기화 메서드를 private으로 선언
    // 초기화 메서드를 private으로 지정하면 SampleData의 인스턴스는 오직 SampleData 클래스 내부에서만 생성될 수 있음!!!!
    // 전역에서 공유되는 객체를 생성할 때 흔히 사용되는 패턴
    private init() {
        let schema = Schema([
                    Friend.self,
                    Movie.self,
            ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        
        do{
            // 스키마와 모델 config를 넘겨줄 모델컨테이너를 만듦
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            
            insertSampleData()
            
            try context.save() // 저장 ....
            
        } catch {
            fatalError("Could not create 모델 컨테이너 \(error)")
        }
    }
    
    private func insertSampleData() {
        for friend in Friend.sampleData {
            context.insert(friend)
        }
        
        for movie in Movie.sampleData {
            context.insert(movie)
        }
    }

}
