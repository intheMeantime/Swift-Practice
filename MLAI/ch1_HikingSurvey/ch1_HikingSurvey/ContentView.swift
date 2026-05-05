//
//  ContentView.swift
//  ch1_HikingSurvey
//
//  Created by nooy on 5/5/26.
//

import SwiftUI

struct ContentView: View {
    @FocusState private var textFieldIsFocused: Bool
    // @FocusState 라는 property wrapper는 하나의 화면(scene) 내에서 어떤 뷰가 포커스를 가지고 있는지를 추적하고 변경할 수 있게 해줌.
    // 이를 사용해 TextField가 포커스를 가지고 있는지 추적하고, 특정 동작이 수행될 때 키보드를 내려(숨기도록) 처리할 수 있다!
    @State var responses: [Response] = []
    @State private var responseText = "" // 입력받아오기
    var scorer = Scorer()
    
    
    // 문장을 받아서 분석하고 저장까지 하는 함수
    func saveResponse(text: String) {
        let score = scorer.score(text)
        let response = Response(text: text, score: score)
        
        responses.insert(response, at: 0)
    }
    
    
    
    
    
    var body: some View {
        VStack {
            Text("Opinions on Hiking")
                .frame(maxWidth: .infinity)
                .font(.title)
                .padding(.top, 24)
            ScrollView {
                ChartView(responses: responses)
                
                
                ForEach(responses) { response in
                    //                    Text(response.text)
                    ResponseView(response: response)
                }
                
            }
            HStack {
                // axis 속성을 설정하면 키보드의 Return 버튼이 더 이상 기본적으로 텍스트 필드의 내용을 제출하지 않음.
                TextField("What do you think about ...?", text: $responseText, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .lineLimit(5)
                
                Button("Done") {
                    guard !responseText.isEmpty else { return } // 비어있을 때는 제출 안 되도록
                    saveResponse(text: responseText)
                    // 이제 사용자 입력을 받을 수 있으며, 제출된 텍스트의 감성을 분석함.
                    responseText = "" // 텍스트 필드 비우기
                    textFieldIsFocused = false // textFieldIsFocused를 false로 설정하여 키보드를 닫음
                }
                .padding(.horizontal, 4)
            }
            .padding(.bottom, 8)
            
            
        }
        .onAppear {
            for response in Response.sampleResponses {
                saveResponse(text: response)
            }
        }
        .padding(.horizontal)
        .background(Color(white: 0.94))
    }
}

#Preview {
    ContentView()
}
