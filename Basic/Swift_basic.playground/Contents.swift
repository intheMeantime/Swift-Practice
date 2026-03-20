import UIKit
// import Cocoa


// ** Switch statements 스위치 문 **
enum Weather {
    case sun, rain, wind
}

let forecast = Weather.sun
print(forecast) // sun

// forecast가 이미 Weather 타입이라는 것을 알고 있기 때문에
// Weather.sun이 아니라 타입생략하고 .sun 으로 적어도 됨
switch forecast {
case .sun:
    print("nice day")
case .rain:
    print("ㅠㅠ")
default:
    print("should be okay.")
}


// ** The ternary conditional operator 삼항연산자 **
let age = 18
let canVote = age >= 18 ? "yes" : "no"
print("can Vote? : \(canVote)")


// ** Loop 반복문 **
for i in 0...3 { //0이상 3이하
    print(i)
}
print("range() 없이 ...으로 됨.......... ")
for i in 0..<4 { //0이상 4미만
    print(i)
}


// ** Function 함수 **
// 파라미터 이름 지정 안하고 싶으면 _ 로 두고
func isUppercas(_ string: String) -> Bool {
    string == string.uppercased()
}
let string = "HELLO WORLD"
let result = isUppercas(string)

// 지정하면 아래처럼 넘겨주면 됨
func TimesTables(for number: Int) {
    for i in 0...4 {
        print("\(i)x\(number) is \(i*number)")
    }
}
TimesTables(for: 7)


// ** Handling errors in functions **
// 발생할 수 있는 에러 정의
enum PasswordError: Error {
    case short, obvious
}

// 에러를 반환하는 함수임을 throws 로 알려줌
func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    if password == "12345" {
        throw PasswordError.obvious
    }
    
    // 에러가 아닌 정상인 경우도 함께 설정
    if password.count < 10 {
        return "ok"
    } else {
        return "good"
    }
}


let strings = ["12345", "abcdefg123456"]

// thorwing function은 do 블럭으로 호출하고, try로 에러를 잡을 수 있게 해야 함
for string in strings {
    do {
        let result = try checkPassword(string)
        print("Password Rating: \(result)")
    } catch PasswordError.obvious {
        print("I have the same combination Password on my luggage!")
    } catch { // 모든 타입 수용 가능하게
        print("password - There was an error.")
    }
}


// ** Closures 클로저 **
// 상수나 변수에 직접 함수를 할당
let sayHello = {
    print("Hi there!")
}
sayHello()

// 여기부터 해야됨 ;ㅜㅠㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜ




// ** Struct **
struct Album {
    let title: String
    let artist: String
    var isReleased = true

    func printSummary() {
        print("\(title) by \(artist)")
    }

    // struct에서 정의해둔 값을 변경하려면 mutating을 해야 함
    mutating func removeFromSale() {
        isReleased = false
    }
}

let red = Album(title: "Red", artist: "Taylor Swift")
print(red.title)
red.printSummary()
