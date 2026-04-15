import SwiftUI

struct WordCanvas: View {
    @Environment(Alphabetizer.self) private var alphabetizer
    // @Environment를 사용하여 환경으로부터 Alphabetizer 인스턴스를 가져오기
//    @State private var tiles: [Tile] = [
//        Tile(word: "First"),
//        Tile(word: "Second"),
//        Tile(word: "Third")
//    ]
    private var tiles: [Tile] {
        alphabetizer.tiles
    }

    var body: some View {
        ZStack {
            HStack(spacing: Tile.spacing) {
                ForEach(tiles) { _ in
                    Rectangle()
                        .fill(Color.purple.opacity(0.2))
                        .offset(y: -(Tile.size + Tile.halfSize))
                        .frame(width: Tile.placeholderSize, height: Tile.placeholderSize)
                }
            }
            // $바인딩은 @State 에서 제공하는 것....
            ForEach(tiles) { tile in
                TileView(tile: tile)
                    .offset(tile.centeredOffset)
                    .gesture(DragGesture().onChanged { value in
                        tile.position = value.location
                    })
            }
            .offset(x: Tile.halfSize)
        }
        .onAppear {
            setInitialTilePositions()
        }
        .onChange(of: alphabetizer.message) { oldValue, newValue in // 기존 값과 새로운 값 비교
            switch (oldValue, newValue) {
            case (.youWin, .instructions):
                withAnimation {
                    setInitialTilePositions()
                }

            default :
                break
            }
        }
    }
}

#Preview {
    WordCanvas()
        .environment(Alphabetizer())
}
// @Observable을 환경을 통해 공유하는 것과 SwiftData를 설정하는 것의 차이를 생각해보세요. SwiftData의 .modelContainer는 강력하지만 그만큼 복잡한 부분을 숨기고 있습니다. 이는 특정 타입에 대한 저장소를 설정하거나, 인메모리 저장소를 사용하거나, 컨테이너와 함께 초기 설정 코드를 실행해줍니다.



extension WordCanvas {
    private func setInitialTilePositions() {
        // Distribute tiles apart from each other but still centered
        // 0,0 is in the middle of the stack
        tiles.enumerated().forEach { index, tile in
            let midpoint = Double(tiles.count - 1) / 2.0
            let position = Double(index) - midpoint

            tiles[index].position.x = (Tile.size + Tile.spacing) * position
            tiles[index].position.y = Tile.halfSize
        }
    }
}

extension Tile {
    static let placeholderSize = size - 20.0
    static let size = 200.0
    static let halfSize = 100.0
    static let spacing = 50.0

    // Drag from the center of the tile instead of the default top left
    var centeredOffset: CGSize {
        CGSize(width: position.x - Tile.halfSize, height: position.y - Tile.halfSize)
    }
}
