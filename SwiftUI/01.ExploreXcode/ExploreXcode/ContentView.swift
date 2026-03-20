//
//  ContentView.swift
//  01.ExploreXcode
//
//  Created by nooy on 3/20/26.
//

import SwiftUI

struct ContentView: View {
    // 상태변수: UI의 상태를 저장 (view의 처음위치에 정의)
    @State private var showAlert = false //
    @State private var meetPeople = false
    
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            // padding 먼저하면, background가 padding 영역까지 인식
            Text("Hello, world!^.^")
                .padding() // view 사이에 간격 확보
                .background(Color.yellow, in: Capsule())
            
            // background 먼저하면, background까지 view로 간주하여 패딩
            Text("Hello.. world.?/??^%/???")
                .foregroundStyle(Color.blue)
                .background(Color.black, in: Capsule())
                .padding()
            
            // 그림자 추가
            Text("Who's There???")
                .background(Color.orange)
                .shadow(color: .black, radius: 20)
            
            
            Button("Button") {
                // 버튼을 누르면 showAlert 변수를 true로 바꿈
                showAlert = true
            }
            .alert("DREAM", isPresented: $showAlert){
                Button("dream??", role: .cancel){}
            }
            // $는 바인딩(연결)해주는 역할
            // showAlert 값이 true로 바뀌면 UI도 반응한다는 의미
        }
//        .padding()
        
        
        
        NavigationStack {
            HStack {
                Button("No") {
                    meetPeople = true
                    // print("작동")
                }
                .padding(50)
                
                Text("No")
                    .padding(50)
            }
            // .navigationDestination --> 해당 위치에만 새로운 페이지가 쌓임
            // .fullScreenCover --> 전체 화면 전환
            // .sheet --> 카드 느낌으로 90%까지 올라옴
            .fullScreenCover(isPresented: $meetPeople) {
                NextView()
            }
        }
    }
}
        
        struct NextView: View {
            @Environment(\.dismiss) var dismiss
            
            var body: some View {
                Text("too many people")
                // 사진을 누르면 이전 페이지로 돌아가게 하는 기능
                Button {
                    dismiss()
                } label : {
                    Image("people")
                        .scaledToFit()
                }
                
            }
        }
    

        
        #Preview {
            ContentView()
        }
