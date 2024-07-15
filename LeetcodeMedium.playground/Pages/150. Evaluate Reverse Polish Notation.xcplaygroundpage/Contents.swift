class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [Int]()
        for token in tokens {
            if let num = Int(token) {
                stack.append(num)
            } else {
                let b = stack.removeLast()
                let a = stack.removeLast()
                switch token {
                case "*": 
                    stack.append(a*b)
                case "+":
                    stack.append(a+b)
                case "-":
                    stack.append(a-b)
                case "/":
                    stack.append(a/b)
                default:
                    break
                }
            }
        }
        return stack[0]
    }
}

var tokens = ["10","6","9","3","+","-11","*","/","*","17","+","5","+"]
print(Solution().evalRPN(tokens))
