//
//  MomentEntryView.swift
//  1.GratefulMoments
//
//  Created by nooy on 4/16/26.
//

import SwiftUI
import PhotosUI
import SwiftData

struct MomentEntryView: View {
    
    @State private var title = ""
    @State private var note = ""
    @State private var imageData: Data?
    @State private var newImg: PhotosPickerItem? // 사용자가 넘긴 이미지 저장
    @State private var isShowingCancelConfirmation = false
    
    @Environment(\.dismiss) private var dismiss
    @Environment(DataContainer.self) private var dataContainer
    
    
    
    var body: some View {
        
        NavigationStack{
            // 키보드가 나와도 컨텐츠가 보여질 수 있게.. 스크롤뷰에 담아
            ScrollView {
                contentStack
            }
            // 화면 밖으로 스크롤(??) 하면 키보드가 사라지도록 하는 모디파이어
            .scrollDismissesKeyboard(.interactively)
            .navigationTitle("이번엔 어떤 기억을")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    // 작성중인 기록 삭제하기
                    Button("취소", systemImage: "xmark") {
                        if title.isEmpty, note.isEmpty, imageData == nil {
                            dismiss() // 데이터가 아무것도 없으면 바로 창 닫게함.
                        } else {
                            isShowingCancelConfirmation = true // 확인 여부 제어용
                        }
                    }
                    // 입력한 정보를 실수로 삭제하지 않도록 표시!!!
                    .confirmationDialog("삭제의 순간 최종 확인", isPresented: $isShowingCancelConfirmation) {
                        Button("기록을 떠나보낼게요", role: .destructive) {
                            dismiss() // 버튼 누르면 창 닫음
                        }
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    // 기록 추가 버튼
                    Button("Add", systemImage: "checkmark") {
                        let newMoment = Moment(
                            title: title ,
                            note: note,
                            imageData: imageData,
                            timestamp: .now,
                        )
                        dataContainer.context.insert(newMoment)
                        do {
                            try dataContainer.badgeManager.unlockBadge(newMoment: newMoment)
                            try dataContainer.context.save()
                            dismiss()
                        } catch {
                            // 없애지마
                        }
                    }
                    .disabled(title.isEmpty)
                }
            }
        }
    }
    
    
    
    
    
    // 사진 아이콘을 담을 변수 선언
    private var photoPicker: some View {
        
        // 사진 영역을 탭했을 때 라이브러리가 열리도록 함.
        PhotosPicker(selection: $newImg) {
            Group {
                if let imageData, let uiImage = UIImage(data: imageData) {
                    // imageData가 있으면, UIImage로 변환해서 뷰에 띄움!
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                } else {
                    VStack {
                        Image(systemName: "arrow.up.heart.fill")
                            .font(.largeTitle)
                            .padding(.bottom, 5)
                        Text("이미지 추가하기")
                            .font(.footnote)
                    }
                    .frame(height: 250)
                    .frame(maxWidth: .infinity)
                    .background(.blueberry)
                }
            }
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal)
        }
        // 사진 선택을 받아오기 위한 모디파이어
        
        // newImg 값이 바뀔 때마다 실행됨 (사진 선택 감지)
        .onChange(of: newImg) {
            // 선택이 없으면 그냥 종료
            guard let newImg else { return }
            
            Task {
                // .loadtransferable 모디파이어는
                // 포토 라이브러리에서, 필요한 데이터 포맷으로 앱에 이미지를 가져옴
                imageData = try await newImg.loadTransferable(type: Data.self)
            }
        }
        
    }
    
    
    
    
    var contentStack: some View {
        VStack(alignment: .leading) {
            
            
            TextField(text: $title) {
                Text("적어볼까 (Required)")
            }
            .font(.title.bold())
            .padding(.top, 48)
            .padding(.leading)
            Divider()
            
            TextField("주절주절...주절주절..", text: $note, axis: .vertical)
                .multilineTextAlignment(.leading)
                // 최소 다섯 줄의 공간을 확보하고, 최대값을 Int.max로 설정하여 사용자가 원하는 만큼 텍스트를 입력할 수 있도 함.
                .lineLimit(5...Int.max)
                .padding(.leading)
            
            photoPicker
            
        }
    }
    
    
}

#Preview {
    MomentEntryView()
        .sampleDataContainer()
}
