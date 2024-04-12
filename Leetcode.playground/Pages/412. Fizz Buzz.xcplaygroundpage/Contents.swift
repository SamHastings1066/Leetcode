// Simpled solution
//class Solution {
//    func fizzBuzz(_ n: Int) -> [String] {
//        var result = [String]()
//        for i in 1...n {
//            if i % 3 == 0 {
//                if i % 5 == 0 {
//                    result.append("FizzBuzz")
//                } else {
//                    result.append("Fizz")
//                }
//            } else if i % 5 == 0 {
//                result.append("Buzz")
//            } else {
//                result.append(String(i))
//            }
//        }
//        return result
//    }
//}

// FizzBuzzJazz solution
// N.B. doesn't work becuase there are no ordered Dicts in Swift
//class Solution {
//    func fizzBuzz(_ n: Int) -> [String] {
//        var fbj = [3: "Fizz", 5: "Buzz", 7: "Jazz"]
//        var result = [String]()
//        for i in 1...n {
//            var temp = ""
//            for (key, value) in fbj {
//                if i % key == 0 {
//                    temp.append(value)
//                }
//            }
//            result.append(temp.isEmpty ? String(i) : temp)
//        }
//
//        return result
//    }
//}

// One-liner
//class Solution {
//    func fizzBuzz(_ n: Int) -> [String] {
//        (1...n).map{$0.isMultiple(of: 15) ? "FizzBuzz" : $0.isMultiple(of: 3) ? "Fizz" : $0.isMultiple(of: 5) ? "Buzz" : String($0) }
//    }
//}

// Case Switch
class Solution {
    func fizzBuzz(_ n: Int) -> [String] {
        var result = [String]()
        for num in 1...n {
            switch (num % 3, num % 5) {
            case (0,0):
                result.append("FizzBuzz")
            case (0,_):
                result.append("Fizz")
            case (_,0):
                result.append("Buzz")
            case (_,_):
                result.append(String(num))
            }
        }
        return result
    }
}



print(Solution().fizzBuzz(15))
