## [Data Modeling] 3-1. Navigation, editing, and relationships: Navigate sample data

<https://developer.apple.com/tutorials/develop-in-swift/navigate-sample-data>

- `NavigationSplitView`
    - NavigationSplitView를 사이드바와 디테일 영역으로 구성!
    - 사이드바에는 보통 항목들의 리스트가 포함되며, 각 항목을 선택하면 해당 항목에 대응하는 하위 뷰가 디테일 영역에 표시됨

- 데이터 관리하기 위한  `SampleData` 클래스 
    - `modelContainer`와 `Schema`의 등장
    - 스키마와 모델 config를 넘겨줄 모델컨테이너를 만듦
    ```Swift
    modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
    ```

