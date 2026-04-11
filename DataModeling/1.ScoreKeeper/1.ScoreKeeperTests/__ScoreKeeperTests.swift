//
//  __ScoreKeeperTests.swift
//  1.ScoreKeeperTests
//
//  Created by nooy on 4/9/26.
//

import Testing
@testable import ScoreKeeper
// 모듈 이름은 문자로 시작해야 한다.. 프로젝트-TARGETS-Build Settings-Product Module Name-이름 변경 ㅜㅜ


struct __ScoreKeeperTests {

    @Test("플레이어들 점수를 리셋해버릴 겁니다", arguments: [0, 10, 20]) // The string passed to the @Test annotation is how the test navigator refers to your test.
    func resetScore(to newValue: Int) async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        var scoreboard = Scoreboard(players: [
                    Player(name: "nooy", score: 0),
                    Player(name: "yoon", score: 0),
                ])
        
        scoreboard.resetScore(to: newValue)
        
        // scoreboard에 있는 각 플레이어를 순회하면서, 각 플레이어의 점수가 0일 것이라고 #expect를 사용해 명시
        for player in scoreboard.players {
            // Testing 프레임워크: 테스트를 실행할 때 #expect 구문 안의 표현식을 평가함
            // 만약 결과가 false라면?? 해당 테스트는 실패
            #expect(player.score == newValue)
        }
        
    }
    
    
    
    @Test("가장 점수 높은사람이 이기는가????")
    func highestScorerWins() { // 테스트할 때만 쓰는 함수임
        let scoreboard = Scoreboard(
            players: [
                Player(name: "nooy", score: 0),
                Player(name: "yoon", score: 4),
            ],
            state: .gameOver, // .setup 으로 바꾸면 실패함!
            doesHighestScoreWin: true
        )
        
        let winners = scoreboard.winners
            #expect(winners == [Player(name: "yoon", score: 4)])
    }
    
    
    
    @Test("가장 점수 >>낮음<< 사람이 이기는가????")
    func lowestScoreWins() { // 테스트할 때만 쓰는 함수임
        let scoreboard = Scoreboard(
            players: [
                Player(name: "nooy", score: 0),
                Player(name: "yoon", score: 4),
            ],
            state: .gameOver,
            doesHighestScoreWin: false
        )
        
        let winners = scoreboard.winners
            #expect(winners == [Player(name: "nooy", score: 0)])
    }
    

}
