//
//  MomentDetailView.swift
//  1.GratefulMoments
//
//  Created by nooy on 4/18/26.
//

import SwiftUI
import SwiftData


struct MomentDetailView: View {
    var moment: Moment
    @State private var showConfirmation = false
    
    // \.dismiss → SwiftUI가 기본으로 제공하는 “현재 화면을 닫는 동작”
    @Environment(\.dismiss) private var dismiss
    @Environment(DataContainer.self) private var dataContainer
    
    let GradientColors: [Color] = [ .appBackgroundBottom, .appBackgroundTop,]
    
    var body: some View {
        ScrollView {
            contentStack
        }
        .navigationTitle(moment.title) // 세부정보니까 타이틀을 여기서 주는구만
        // 삭제 툴바 만들기
        .toolbar {
            ToolbarItem(placement: .destructiveAction) {
                Button{
                    showConfirmation = true
                } label: {
                    Image(systemName: "trash")
                }
                .confirmationDialog("삭제의 순간", isPresented: $showConfirmation){
                    Button("네", role: .destructive){
                        dataContainer.context.delete(moment)
                        try? dataContainer.context.save()
                        dismiss()
                    }
                } message: {
                    Text("이제 이 기록은 사라지고 기억에만 남게 됩니다")
                }
            }
        }
        .background(Gradient(colors: GradientColors))
    }
    
    // 컨텐츠 스택 뷰
    private var contentStack: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(moment.timestamp, style: .date)
                    .font(.subheadline)
                Spacer()
                ForEach(moment.badges) {badge in
                    NavigationLink{
                        BadgeDetailView(badge: badge)
                    } label: {
                        Image(badge.details.image)
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                }
            }
            // 비어있을 수도 있으니까 확인해줘야 함
            if !moment.note.isEmpty {
                Text(moment.note)
                    .textSelection(.enabled) // 길게 눌러서 복사 가능하도록!! 함
            }
            
            if let image = moment.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }

}

    
#Preview {
    NavigationStack{
        MomentDetailView(moment: .imageSample)
            .sampleDataContainer()
    }
}


#Preview("Long note") {
    NavigationStack {
        MomentDetailView(moment: Moment.longTextSample)
            .sampleDataContainer()
    }
}
