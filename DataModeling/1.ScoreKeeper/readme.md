## [Data Modeling] 1-1. Custom types and Swift Testing: Model data with custom types

<https://developer.apple.com/tutorials/develop-in-swift/model-data-with-custom-types>

- 뷰가 없는 Swift file 생성하여 내가 필요한 struct type을 만들기

- Protocol 프로토콜
```Swift
struct Player: Identifiable { // 여기서 Identifiable 같은 애들은 Protocol 이라고 부름. 이 프로토콜을 따르는 애들(구조)이라는 뜻.
    let id = UUID() // 동일한 데이터 값이 들어와도 구분할 수 있도록 ID 를 주어야 함
    ...
}
```

- `ForEach`에서 배열
    - 배열을 만들고, `ForEach` 문에서 $바인딩하여 리스트에 접근하여 뷰에 표시할 수 있음.
```Swift
ForEach($players) { $player in
    TextField("Name", text: $player.name)
    Text("\(player.score)")
}
```

- `Grid`: 전체 표(테이블) 같은 컨테이너 -> 표처럼 깔끔하게 정렬시킬 수 있음!
```Swift
    Grid {
        GridRow {
```

## Preview


