//
//  FriendDetail.swift
//  3.FriendsFavoriteMovies
//
//  Created by nooy on 4/13/26.
//

import SwiftUI
import SwiftData

struct FriendDetail: View {
    // @Bindable: 사람들이 편집할 수 있는 property
    // friend를 @Bindable 프로퍼티로 만들면, 해당 프로퍼티 자체나 그 속성들에 대한 $바인딩을 TextFeild 같은 컨트롤에 전달할 수 있음.
    @Bindable var friend: Friend
    let isNew: Bool
    
    // 세이브 버튼을 누르면 sheet를 dismiss해야하므로..
    @Environment(\.dismiss) private var dismiss
    // 취소하는 경우 변경내역에서 돌아오기 위한 것..
    @Environment(\.modelContext) private var context
    
    // 커스텀 초기화
    init(friend: Friend, isNew: Bool = false) {
           self.friend = friend
           self.isNew = isNew
       }
    
    
    var body: some View {
        Form { // form 컨테이너 (걍 레이아웃인듯)
            TextField("Name", text: $friend.name)
                .autocorrectionDisabled()
            Image("wosagi")
                .resizable()
                .frame(width: 200, height: 200)
        }
        .navigationTitle(isNew ? "새 친구" : "Friend")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            // "새친구"일 때만 툴바 넣음
            if isNew {
                // .confirmationAction을 사용해 아이템의 위치를 의미적으로 지정하면, SwiftUI가 이에 맞는 적절한 위치를 자동으로 선택해줌
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("취소취소") {
                        // 시트가 생기면서 생겨버린 값을 되돌리기
                        context.delete(friend)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        FriendDetail(friend: SampleData.shared.friend)
    }
}

#Preview("새친구") {
    NavigationStack {
        FriendDetail(friend: SampleData.shared.friend, isNew: true)
    }
}
