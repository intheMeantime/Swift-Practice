//
//  Alphabetizer.swift
//  Alphabetizer
//
//  Created by nooy on 4/15/26.
//

import Foundation
import Observation

// 클래스는 고유한 id 식별자가 있음.
@Observable // 매크로: 클래스에 새로운 기능을 추가
class Alphabetizer {
    private let tileCount = 3
    private var vocab: Vocabulary
    
    var tiles = [Tile]() // 사용자가 끌어당기는 단어타일을 담는 변수
    var score = 0
    var message: Message = .instructions // 내가 만들어둔 Message enum 에서 가져옴!
    
    
    init(vocab: Vocabulary = .landAnimals) {
        self.vocab = vocab
        startNewGame()
    }
    
    
    
    
//    private var isAlphbetized = false
    
    /// 타일이 알파벳 순서로 정렬되었는지 체크하는 함수
    // 오 슬래시 3개 하면 documentation 주석,,으로 다른 데서 이 함수에다 option 키 누르면 주석 설명이 뜸 ;;;ㄷㄷㄷㄷㄷㄷㄷ
    func submit() {
        //todo: 제출하는 거 구현해야 함
        
        // TODO: 비교 코드 써야함
//        isAlphbetized.toggle()
        
        // 사용자가 배열한 결과(position)로 정렬시킨 배열 (y)
        let userSortedTiles = tiles.sorted {
            $0.position.x < $1.position.x
        }
        
        // 타일들을 알파벳 순으로 정렬시킨 배열 (ground truth)
        let alphabeticallySortedTiles = tiles.sorted {
            $0.word.lexicographicallyPrecedes($1.word)
        }
        
        // 위 두 배열을 비교하기 위해서는 Tile은 Equatable 설정을 해줘야 함!! ( extension Tile: Equatable {...} )
        
        let isAlphbetized = userSortedTiles == alphabeticallySortedTiles
        
        
        
        

        
        // 만약 알파벳순이면, 점수 증가
        if isAlphbetized {
            score += 1
        }
        
        // 이겼는지 졌는지 메시지 바꾸기
        message = isAlphbetized ? .youWin : .tryAgain
        
        // 맞는 타일은 뒤집기
        
//        for tile in tiles {
        for (tile, correctTile) in zip(userSortedTiles, alphabeticallySortedTiles) {
            // TODO: 맞는 상태인지 체크해야 함
            
            let tileIsAlphabetized = tile == correctTile
            tile.flipped = tileIsAlphabetized
        }
        
        
        
        
        // SwiftUI 뷰 밖에서는, Task를 사용해 비동기 코드를 실행 ........
        Task { @MainActor in // Task가 메인 액터를 사용하도록 조정
            // 2초 기달
            try await Task.sleep(for: .seconds(5))
            
            // 전부 알파벳으로 되었으면, 새로운 타일들 생성
            if isAlphbetized {
//                tiles.removeAll() // 배열이니까
                startNewGame()
            }
            
            
            // 타일을 다시 원래대로 뒤집기 .. flip tiles back to words
            for tile in tiles {
                tile.flipped = false
            }
            
            
            // 인스트럭션 원래대로 보여주기
            message = .instructions
            
        }
        
    }
    
    
    
    
    // MARK: private implementation
    // MARK 주석을 사용하여 Alphabetizer의 public 영역과 private 영역을 구분함. 이 파일 외부에서 호출되어야 하는 것은 submit뿐입니다.!!!!
    
    /// 새로운 단어 세트로 타일을 업데이트 하는 함수 (뉴게임 시작)
    private func startNewGame() {
        let newWords = vocab.selectRandomWords(count: tileCount)
        
        if tiles.isEmpty {
            for word in newWords {
                tiles.append(Tile(word: word))
            }
        } else {
            // 타일에 새로운 단어 할당
//            for index in 0..<tileCount {
//                let tile = tile[index]
//                let word = newWords[index]
//                tile.word = word
//            }
            for (tile, word) in zip(tiles, newWords) {
                tile.word = word
            }
        }
        
        
    }
    
}
