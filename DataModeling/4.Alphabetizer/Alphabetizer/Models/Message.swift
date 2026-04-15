//
//  Message.swift
//  Alphabetizer
//
//  Created by nooy on 4/15/26.
//

import Foundation


// enum에 String 원시값(raw value)을 부여하면, 각 enum 케이스에 문자열 값을 연결할 수 있음! (... .instruction.rawValue)
enum Message: String {
    case instructions = "타일을! 알파벳 순서로! 배열하시오 :)"
    case tryAgain = "다시다시"
    case youWin = "맞아요!!~~~!~!~!~!~!"
    
}
