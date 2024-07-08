// First attempt
//class Solution {
//    
//    let values = [1,4,5,9,10,40,50,90,100,400,500,900,1000]
//    let symbols = ["I","IV","V","IX","X","XL","L","XC","C","CD","D","CM","M"]
//    
//    func largestSubtractor(_ num: Int) -> Int {
//        var i = 0
//        while i < 13 {
//            if values[i] > num {
//                i-=1
//                break
//            } else {
//                i += 1
//            }
//        }
//        return min(i,12)
//    }
//    
//    func intToRoman(_ num: Int) -> String {
//        var ans = ""
//        var num = num
//        
//        while num > 0 {
//            let subtractorIndex = largestSubtractor(num)
//            print(num)
//            print(values[subtractorIndex])
//            num -= values[subtractorIndex]
//            ans.append(symbols[subtractorIndex])
//        }
//        
//        return ans
//    }
//}


// Same approach, but cleaner implementation
//class Solution {
//    
//    let values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
//    let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
//        
//    
//    func intToRoman(_ num: Int) -> String {
//        var ans = ""
//        var num = num
//        
//        while num > 0 {
//            for (i,d) in values.enumerated() where d <= num {
//                num -= d
//                ans.append(symbols[i])
//                break
//            }
//        }
//        
//        return ans
//    }
//}

// Another almost identical approach
class Solution {
    
    let values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
    let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
        
    
    func intToRoman(_ num: Int) -> String {
        var ans = ""
        var num = num
        
        while num > 0 {
            for i in 0..<values.count {
                if num <= 0 { break }
                while values[i] <= num {
                    num -= values[i]
                    ans.append(symbols[i])
                }
            }
        }
        
        return ans
    }
}

let num = 3749
print(Solution().intToRoman(num))
