//
//  ContentView.swift
//  2.Birthdays
//
//  Created by nooy on 4/12/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
//    @State private var friends: [Friend] = [
//        Friend(name: "nooy", birthday: .now),
//        Friend(name: "david", birthday: Date(timeIntervalSince1970: 0))
//    ]
    
    @Query(sort: \Friend.birthday) private var friends: [Friend]
    // friends 배열의 어노테이션을 @Query로 하여 SwiftData에 저장된 Friend 인스턴스를 가져와!!!!
    // 이름에서 알 수 있듯이, @Query는 SwiftData에 데이터 배열을 요청 — 이 경우 [Friend]. SwiftData에 저장된 Friend 인스턴스를 업데이트하면, @State 프로퍼티처럼 해당 쿼리가 뷰를 자동으로 업데이트함.
    // birthday 기준으로 sorting함!
    @Environment(\.modelContext) private var context
    // ModelContext는 뷰와 모델 컨테이너 사이의 연결을 제공하여,
    // 컨테이너 안의 데이터를 가져오고(fetch), 추가(insert)하고, 삭제(delete)할 수 있게 해줌. (C R U D 기능 ..)
    // ContentView에 추가한 .modelContainer 수정자는 SwiftUI 환경에 modelContext를 주입하며, 이 modelContext는 해당 컨테이너 아래의 모든 뷰에서 접근할 수 있음
    
    
    
    @State private var newName = ""
    @State private var newDate = Date.now
    
    
    
    var body: some View {
        
        NavigationStack {
            // 리스트를 네비게이션스택 안에다가 넣기!
            //List(friends, id: \.name) {friend in
            List(friends) {friend in // 스위프트데이터는 고유 식별자 제공!
                HStack {
                    if friend.isBirthdayToday {
                        Image(systemName: "balloon.2.fill")
                            .foregroundStyle(.orange)
                    }
                    Text(friend.name)
                        .bold(friend.isBirthdayToday)
                        .foregroundStyle(friend.isBirthdayToday ? .orange : .primary)
                    Spacer()
                    Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                }
                
            }
            .navigationTitle(Text("The day life began"))
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .center, spacing: 20) {
                    Text("New")
                        .font(.headline)
                    // (newDate에 받아오겟다, 과거부터 지금만 선택가능, 시간은 빼고 날짜만 띄우겠다)
                    DatePicker(selection: $newDate, in: Date.distantPast...Date.now, displayedComponents: .date){
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                    }
                    Button("SAVE") {
                        let newFriend = Friend(name: newName, birthday: newDate)
                        // newFriend는 입력된 이름과 생일을 포함하는 Friend의 인스턴스임. Friend는 뷰가 아니며 body도 없다는 것을 기억하세요;;;;; 이는 이 두 가지 데이터를 모델링한 것뿐
                        // friends.append(newFriend)
                        // 따라서 이렇게 어펜드 해주면 됨!
                        
                        context.insert(newFriend)
                        // 스위프트 데이터를 쓰면 insert로 .. 영구저장!!!!!!!!
                        
                        newName=""
                        newDate=Date.now
                    }
                    .fontWeight(.heavy)
                }
                .padding()
                .background(.bar) // .bar : 배경을 시스템 툴바와 동일하게 만듦
            }
            .task{
                context.insert(Friend(name: "nooy", birthday: .now))
                context.insert(Friend(name: "david", birthday: Date(timeIntervalSince1970: 0)))
            }
    
            
        }
        
        
        
        
        
        
        
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Friend.self, inMemory: true)
    // inMemory를 true로 지정하면, 컨테이너가 메모리 기반 컨테이너를 사용하도록 지시하는 것. 여기서 메모리 기반(in-memory)이란 저장 방식과 관련된 것으로, 앱이 메모리에 올라가 있는 동안에만 데이터가 저장된다는 의미
}
