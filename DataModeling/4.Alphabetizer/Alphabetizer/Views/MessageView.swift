import SwiftUI

struct MessageView: View {

    // TODO: Different messages after winning or losing the game --> 환경에서 불러옴!
//    @State private var message = "Place the tiles in alphabetical order"
    @Environment(Alphabetizer.self) private var alphabetizer

    var body: some View {
        Text(alphabetizer.message.rawValue)
            .font(.largeTitle)
    }
}


#Preview {
    // 다른 애들도 잘 표시되는지 확인
    
    let alphabetizer = Alphabetizer()
    alphabetizer.message = .youWin
    
    return MessageView()
        .environment(alphabetizer)
}
