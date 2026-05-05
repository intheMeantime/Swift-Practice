//
//  ChartView.swift
//  ch1_HikingSurvey
//
//  Created by nooy on 5/5/26.
//

import SwiftUI
import Charts

struct ChartView: View {
    var responses: [Response]
    
    // strunct인데 init을 하네.,
    init(responses: [Response]) {
        // 점수 기준으로 배열을 정렬 ( 그룹으로 묶기 위해서)
        self.responses = responses.sorted { $0.score < $1.score }
    }
    
    
    var body: some View {
        Chart(responses) { response in
            // value의 두 번째 인자는 가중치임
            SectorMark(angle: .value("Type", 1), innerRadius: .ratio(0.65)) //, angularInset: 2)
                .foregroundStyle(by: .value("sentiment", response.sentiment))
            // sentiment범례에서 추가 데이터를 읽어올 수 있으므로 범례를 자동으로 표시
        }
        .chartForegroundStyleScale([
            Sentiment.positive : Sentiment.positive.sentimentColor,
            Sentiment.negative : Sentiment.negative.sentimentColor,
            Sentiment.moderate : Sentiment.moderate.sentimentColor
        ])
        .chartBackground { chartProxy in
            GeometryReader { geometry in
                if let anchor = chartProxy.plotFrame {
                    let frame = geometry[anchor]
                    Image(systemName: "figure.hiking")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: frame.height * 0.4)
                        .foregroundStyle(Color(white: 0.59))
                        .position(x: frame.midX, y: frame.midY)
                }
            }
            
        }
        // 범례 위치 조정
        .chartLegend(position: .trailing, alignment: .center)
        .frame(height: 150)
        .padding()
    }
}


//
//#Preview {
//    ChartView()
//}
