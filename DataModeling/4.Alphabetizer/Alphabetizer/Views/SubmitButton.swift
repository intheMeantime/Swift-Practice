import SwiftUI

struct SubmitButton: View {
    @Environment(Alphabetizer.self) private var alphabetizer
    
    var body: some View {
        Button {
            // TODO: Submit
            alphabetizer.submit()
            // 상태를 바꿔줘야 하므로 alphabetizer에 있는 함수로 상태를 바꾸는 것 같음!!!!!!!!!
            
        } label: { // 버튼 생김새
            Image(systemName: "play.circle")
                .font(.system(size: 60))
                .foregroundStyle(Color.white)
                .padding(.horizontal, 80)
                .padding(.vertical, 20)
                .background(RoundedRectangle(cornerRadius: 30)
                    .fill(Color.purple)
                    .opacity(isEnabled ? 1.0 : 0.2)
                )
        }
        .animation(.default, value: isEnabled)
        .disabled(!isEnabled)
    }
    
    var isEnabled: Bool {
        alphabetizer.message == .instructions
    }
    
    
}

#Preview {
    SubmitButton()
        .environment(Alphabetizer())
}
