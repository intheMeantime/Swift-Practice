//
//  ContentView.swift
//  5.Pick-a-Pal
//
//  Created by nooy on 3/31/26.
//

import SwiftUI

struct ContentView: View {
    @State private var names: [String] = ["Good Time", "Good Time for the Team", "Meantime", "Get Back"]
    @State private var nameToAdd = ""
    @State private var pickedName = ""
    @State private var shouldRemovePickedName: Bool = false
    
    
    var body: some View {
        VStack {
            VStack(spacing:8) {
                Image(systemName: "shareplay")
                    .font(.largeTitle)
                    .foregroundStyle(.tint)
                    .symbolRenderingMode(.hierarchical)
                Text("Pick a Album")
                    .font(.title)
            }
            .bold()
            .padding(.bottom, 10)
            
            ZStack{
                
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 300, height: 50)
                    .foregroundStyle(.tint.opacity(0.5))
                
                Text(pickedName.isEmpty ? " " : pickedName)
                    .foregroundStyle(.white)
                    .font(.system(size:20).lowercaseSmallCaps())
                    .fontWeight(.heavy)
                
                
            }
            
            
            List{
                ForEach(names, id: \.description) { name in
                    Text(name)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 8))
//            .border(.red)
            


            // nameToAdd 속성을 바인딩(Binding) 하여
            // 사용자의 입력값을 nameToAdd에 저장
            TextField("Add Album", text: $nameToAdd)
                // 자동완성 취소
                .autocorrectionDisabled(true)
                // 버튼과 마찬가지로 .onSubmit은 사용자가 Return 키를 눌렀을 때 실행할 명령형 코드를 클로저로 작성
                .onSubmit{
                    if !nameToAdd.isEmpty {
                        // 새로 받은 이름을 리스트에 추가하고 다시 ""로 리셋
                        names.append(nameToAdd)
                        nameToAdd = ""
                    }
                }

            
            Divider()
            
            Toggle("Remove when picked", isOn: $shouldRemovePickedName)
            
            
            Button { // 액션 클로저
                // 배열이 비어있으면 randomElement()는 nil 을 반환하기 때문에
                // if let 으로 nil일 경우를 처리
                if let randomAlbum = names.randomElement() {
                    pickedName = randomAlbum
                    
                    if shouldRemovePickedName {
                        // removeAll { 조건 } : 조건을 만족하는 모든 요소를 삭제
                        names.removeAll { name in
                            return (name == randomAlbum)
                        }
                    }
                } else {
                    pickedName = "NO ALBUMS HERE! T.T "
                }
                
            } label: { // 레이블 클로저 --> 어떤 뷰든간에 버튼으로 만들 수 있음!
                Text("Pick Random Album")
            }
            .buttonStyle(.glassProminent)
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
