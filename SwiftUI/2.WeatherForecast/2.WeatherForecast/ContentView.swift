//
//  ContentView.swift
//  2.WeatherForecast
//
//  Created by nooy on 3/23/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            // subview
            DayForcsat(day: "Mon", weather: "sunny", hight:70, low:50)
//                .padding(.horizontal, 5)
            
            DayForcsat(day:"Tue", weather: "rainy", hight:60, low:40)
//                .padding(.horizontal, 5)
            
            DayForcsat()
//                .padding(.horizontal, 5)

        }
        .padding()
    }
}




// 새로운 subview용 스트럭트 생성 (계속 쓸 틀을 생성)
struct DayForcsat: View {
    var day : String = "Dream"
    var weather: String = "Dream"
    var hight: Int = -10
    var low: Int = 9999
    
    // 랜덤 선택용 리스트
    let icons_2 = ["sparkles", "fan","fan.slash", "clock.badge.questionmark", "clock.badge.questionmark.fill"]

    var iconname: String {
        if weather == "sunny" {
            return "sun.max.fill"
        }
        else if weather == "rainy" {
            return "cloud.rain.fill"
        }
        else {return "tornado"}
    }
    // 이렇게 모든 케이스를 매핑한다고..?
    var iconcolor: Color {
        if weather == "sunny" {
            return Color.red
        }
        else if weather == "rainy" {
            return Color.blue
        }
        else {return Color.orange}
    }
    //
    
    
    // 여기부터 ㄹㅇ 섭뷰!!!
    var body: some View {
        VStack {
            Text(day)
                .font(Font.headline)
            // View > Show library (shift+command+L)
            Image(systemName: iconname)
                .foregroundStyle(iconcolor)
                .font(Font.system(size: 60))
            
            Text("Hight: \(hight)")
                // 글자 굵기만! 변경
                .fontWeight(Font.Weight.medium)
            Text("Low: \(low)")
                // .fontWidth(.condensed) // 자간
                .fontWeight(Font.Weight.medium)
                .foregroundStyle(Color.black.opacity(0.7))
            
            Image(systemName: icons_2.randomElement()!)
                .shadow(color: iconcolor, radius: 15)
            Image(systemName: icons_2.randomElement()!)
                .shadow(color: iconcolor, radius: 15)
            Image(systemName: icons_2.randomElement()!)
                .shadow(color: iconcolor, radius: 15)
        }
    }
}



#Preview {
    ContentView()
}
