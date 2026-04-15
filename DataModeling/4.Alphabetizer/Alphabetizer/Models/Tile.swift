import Foundation

@Observable
//struct Tile: Identifiable {
class Tile: Identifiable {
    let id = UUID()
    
    var word: String
    var position: CGPoint = .zero
    // When flipped, show a checkmark instead of the word and icon
    var flipped = false
    
    init(word: String) {
        self.word = word
    }
    
    // 단어를 키로 사용하여 딕셔너리에서 값을 찾아오도록 함.
    var icon: String {
        // FIXME: Lookup an icon matching the word
        //        "@"
        Vocabulary.icons[word] ?? "@@@" // 이모지가 없으면 @@@ 사용
    }
}
    
    
    /// 값을 비교하기 위해서는 여기에다가 ...
extension Tile: Equatable {
    static func == (lhs: Tile, rhs: Tile) -> Bool {
        lhs.id == rhs.id
    }
}
