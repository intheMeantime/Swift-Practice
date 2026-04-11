//
//  GameState.swift
//  1.ScoreKeeper
//
//  Created by nooy on 4/9/26.
//

import Foundation

// 열거형은 서로 관련되어 있지만 상호 배타적인 값들의 그룹에 대한 공통 유형을 정의함. struct처럼 여러 인스턴스를 가질 수 있는 객체와는 달리, 열거형에는 정의에 명시된 값만 존재. 게임 상태처럼 몇 가지 값으로 제한된 것을 모델링하는 데 매우 유용
enum GameState {
    case setup
    case playing
    case gameOver
}
