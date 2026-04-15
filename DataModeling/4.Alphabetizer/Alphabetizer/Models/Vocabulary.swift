import Foundation

struct Vocabulary {
    let words: [String]

    /// - returns: `count` unique, random words from `words`, guaranteed unsorted
    func selectRandomWords(count: Int) -> [String] {
        var newWords = Array(words.shuffled().prefix(count))
        while newWords.sorted() == newWords {
            newWords.shuffle()
        }
        return newWords
    }
    
    // 단어에 맞는 이모지를 띄우기 위해 딕셔너리에 넣어둠
    static let icons: [String: String] = [
        "Bear": "🐻",
        "Crab": "🦀",
        "Duck": "🦆",
        "Frog": "🐸",
        "Fox": "🦊",
        "Goose": "🪿",
        "Horse": "🐴",
        "Jellyfish": "🪼",
        "Lizard": "🦎",
        "Octopus": "🐙",
        "Panda": "🐼",
        "Rabbit": "🐰",
        "Sheep": "🐑",
        "Whale": "🐳",
    ]
    
    
    
    
    
}

extension Vocabulary {
    static let landAnimals = Vocabulary(words: [
        "Bear",
        "Duck",
        "Frog",
        "Fox",
        "Goose",
        "Lizard",
        "Panda",
        "Rabbit",
        "Sheep",
    ])

    static let oceanAnimals = Vocabulary(words: [
        "Crab",
        "Jellyfish",
        "Octopus",
        "Whale",
    ])
}
