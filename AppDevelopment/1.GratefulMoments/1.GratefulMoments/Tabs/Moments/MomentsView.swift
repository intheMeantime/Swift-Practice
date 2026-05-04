//
//  MomentsView.swift
//  1.GratefulMoments
//
//  Created by nooy on 4/18/26.
//

import SwiftUI
import SwiftData

struct MomentsView: View {
    @State private var showCreateMoment = false
    
    @Query(sort: \Moment.timestamp, order: .reverse)
    private var moments: [Moment]
    
    // Sin 함수 진폭(?)
    static let offsetAmount: CGFloat = 50.0
    
    let GradientColors: [Color] = [.appBackgroundBottom, .appBackgroundTop,]
    
    
    
    var body: some View {
        NavigationStack {
            ScrollView{
                
                LazyVStack(spacing: 8, pinnedViews: .sectionHeaders) {
                    Section {
                        pathItems
                            .frame(maxWidth: .infinity)
                    } header: {
                        streakHeader
                    }
                }
            }
            .overlay {
                if moments.isEmpty {
                    ContentUnavailableView {
                        Label("기억을 기록하세요", systemImage: "person.and.background.striped.horizontal")
                    } description: {
                        Text("흩어지는 생각과 경험을 붙잡..아요...꼭!")
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button{
                        showCreateMoment = true // 여기에서 바로 시트를 띄우는 게 아니라, 프로퍼티를 수정만 하고, .sheet 모디파이어(?)로 바꾸넴 ...
                    } label: {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $showCreateMoment) {
                        MomentEntryView()
                    }
                    
                }
            }
            .defaultScrollAnchor(.top, for: .initialOffset)
            .defaultScrollAnchor(.top, for: .sizeChanges)
            .defaultScrollAnchor(.top, for: .alignment)
            .navigationTitle("기억기록기")
            .background(Gradient(colors: GradientColors))
        }
        .dynamicTypeSize(...DynamicTypeSize.xLarge)
    }
    
    
    
    // 만들어둔 모양뷰를 foreach로 그리기!
    private var pathItems: some View {
        // enumerated로 id 함께 접근할 수 있음
        ForEach(moments.enumerated(), id: \.0) { idx, moment in
            
            NavigationLink {
                MomentDetailView(moment: moment)
            } label: {
//                Text(moment.title)
                if moment == moments.first {
                    MomentShapeView(moment: moment, layout: .large)
                } else {
                    MomentShapeView(moment: moment)
                        // 위치 지정해주기! sin 이용 ..
                        .offset(x: sin(Double(idx) * .pi / 2) * Self.offsetAmount)
                }
                
            }
            // 스크롤하면서 View가 화면에 들어오거나 나갈 때 자동으로 애니메이션 상태(phase)를 바꿔주는 기능
            // content: 지금 뷰
            // phase: 지금 뷰의 상태
            .scrollTransition {content, phase in
                content
                    // .isIdentity: 정상위치(화면중앙, 원래 상태)에 있는가
                    .opacity(phase.isIdentity ? 1 : 0)
                    .scaleEffect(phase.isIdentity ? 1 : 0.5 )
            }
        }
    }
    
    @ViewBuilder private var streakHeader: some View {
        let streak = StreakCalculator().calculateStreak(for: moments)
        if streak > 0 {
            HStack {
                Text(verbatim: "\(streak)")
                Text(Image(systemName: "flame.fill"))
                    .foregroundStyle(.ember)
                Spacer()
            }
            .font(.subheadline)
            .padding()
        }
    }
    
    
    
}

#Preview {
    MomentsView()
        .sampleDataContainer()
}

#Preview("빈 화면 확인") {
    MomentsView()
        .modelContainer(for: [Moment.self])
}
