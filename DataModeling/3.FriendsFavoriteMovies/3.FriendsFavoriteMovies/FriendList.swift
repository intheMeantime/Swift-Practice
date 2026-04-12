//
//  FriendList.swift
//  3.FriendsFavoriteMovies
//
//  Created by nooy on 4/12/26.
//

import SwiftUI
import SwiftData

struct FriendList: View {
    @Query(sort: \Friend.name) private var friends: [Friend]
    @Environment(\.modelContext) private var context
    // 👉 @Environment는 데이터 주입 방식이고,
    // 👉 private은 그 데이터를 어디까지 노출할지 결정하는 것
    
    var body: some View {
        NavigationSplitView {
            // NavigationSplitView를 사이드바와 디테일 영역으로 구성! 사이드바에는 보통 항목들의 리스트가 포함되며, 각 항목을 선택하면 해당 항목에 대응하는 하위 뷰가 디테일 영역에 표시됨
            List {
                ForEach(friends) { friend in
//                    Text(friend.name)
                    NavigationLink(friend.name) {
                        Text("Detail view for >>\(friend.name)<<")
                            .navigationTitle("Friend")
                            .navigationBarTitleDisplayMode(.inline)
                    }
                }
            }
            //        .task {
            //            context.insert(Friend(name: "nooy"))
            //            context.insert(Friend(name: "yoon"))
            //        }
            .navigationTitle("Friends")
        } detail: {
            // 아무것도 선택되지 않았을 때 보여줄 화면
            // 넓은 화면일 때는 얘까지 보여짐
            Text("Select a friend")
                .navigationTitle("Friend")
                .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

#Preview {
    FriendList()
//        .modelContainer(for: Friend.self, inMemory: true)
        .modelContainer(SampleData.shared.modelContainer)
}
