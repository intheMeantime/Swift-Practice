## [App Development] 1-1. Views and data storage: Collect, model, and store data

<https://developer.apple.com/tutorials/develop-in-swift/collect-model-and-store-data>


- 갤러리에서 사진 선택하기 ` PhotosPicker(selection: $newImg) {...} `
    - `PhotosPicker`는 iOS에서 사진 라이브러리 선택 UI를 띄워주는 뷰
    - `selection: $newImg` --> 사용자가 선택한 사진이 newImg에 $바인딩됨
    


- 툴바에서 데이터 삭제할 때, 경고창 띄우기 `.confirmationDialog`
    ```Swift
    // 입력한 정보를 실수로 삭제하지 않도록 표시!!!
    .confirmationDialog("삭제의 순간 최종 확인", isPresented: $isShowingCancelConfirmation) {
        Button("기록을 떠나보낼게요", role: .destructive) {
            dismiss() // 버튼 누르면 창 닫음
        }
    }
    ```

- **SwiftData @Model** 파일 : `Moment.swift`

    
- **SwiftData Container** 파일: `DataContainer.swift`
    - 데이터 생성/설정/초기화를 View에서 분리해서, 앱 전체에서 재사용 가능한 “중앙 데이터 관리자”를 만들기 위함
    - initialization할 때 schema와 config를 원하는대로 설정해준 다음, ModelContainer에 넣어줌
    ```Swift
        init(includeSampleData: Bool = false) {
        
            // 어떤 모델(@Model)을 DB에 넣을지 정의해줌. (여러 개 가능)
            let schema = Schema([ Moment.self, ])
            
            // 설정값들
            // isStoredInMemoryOnly: true --> 앱을 종료하면 데이터 사라짐!=테스트용 (실제 앱이면 false)
            let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: includeSampleData)
            
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            
            ...
    ```

- `extension` 
    - 데이터 구조만 class 안에 넣어두고, 추가 함수 같은 건 `extension ` 으로 넣을 수 있음

## Preview (1-1)

![preview](img/preview1.png)
