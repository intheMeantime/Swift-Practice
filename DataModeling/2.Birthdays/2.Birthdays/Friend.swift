//
//  Friend.swift
//  2.Birthdays
//
//  Created by nooy on 4/12/26.
//

import Foundation
import SwiftData
// 앱의 데이터를 모델링하고 영구 저장 기능을 사용하여 사용자가 앱을 떠나더라도 데이터가 사라지지 않도록 하는 tool을 제공


@Model // 매크로(macro) 라고 부름
// @Model 은 Swift class 를 (SwiftData가 관리하는) stored model 로 바꿈 --> struct 가 아니라 class로 바꿔야 함
// 클래스는 참조 타입이라 값을 바꿀 수 있음 ( struct는 복서(?) 느낌일아 반영이 안 됨)
class Friend {
    
    // 프로퍼팊 ( 이 규격에 맞춰서 생성이 되는 거임)
    var name: String
    var birthday: Date
    
    init(name: String, birthday: Date) {
        self.name = name
        self.birthday = birthday
    }
    
    var isBirthdayToday: Bool {
        Calendar.current.isDateInToday(birthday)
    }
    
    
    
}


