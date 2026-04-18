//
//  Moment.swift
//  1.GratefulMoments
//
//  Created by nooy on 4/18/26.
//

import Foundation
import SwiftData
import UIKit // CONVERT the image data into a UIImage for display.


@Model
class Moment {
    var title: String
    var note: String
    var imageData: Data? // 이건머지
    var timestamp: Date
    
    init(title:String, note:String, imageData: Data? = nil, timestamp:Date = .now) {
        self.title = title
        self.note = note
        self.imageData = imageData
        self.timestamp = timestamp
    }
    
    
    /// 이미지 데이터를 UI 이미지로 변환시킨 것..
    var image: UIImage? {
        imageData.flatMap{
            UIImage(data: $0)
        }
    }
    
    
}


extension Moment { // 모먼트 클래스의 확장판
    
    static let sample = sampleData[0]
    static let longTextSample = sampleData[1]
    static let imageSample = sampleData[4]


    static let sampleData = [
        Moment(
            title: "마토마",
            note: "토마토마토마토"
        ),
        Moment(
            title: "Passed the test!",
            note: "The chem exam was tough, but I think I did well! I’m so glad I reached out to Guillermo and Lee for a study session. It really helped!",
            imageData: UIImage(named: "Study")?.pngData()
        ),
        Moment(
            title: "Reality is also a pizza",
            note: "조용한 곳을 찾아 가만히 앉아서 숨을 쉬기",
            imageData: UIImage(named: "Relax")?.pngData()
        ),
        Moment(
            title: "바다다",
            note: "바다가 좋다 밤바다 낮바다 새벽바다 아침바다 저녁바다",
            imageData: UIImage(named: "밤바다")?.pngData()
        ),
        Moment(
            title: "더캠프",
            note: "아 콘서트 가고 싶다 더캠쓰리 ㄱㄱ? ",
            imageData: UIImage(named: "Concert")?.pngData()
        )
    ]
}
