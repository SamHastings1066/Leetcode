class Solution {
    class Stack {
        var items: [Character] = []
        
        func push(_ char: Character) {
            items.append(char)
        }
        
        func pop() -> Character? {
            guard !items.isEmpty else { return nil }
            return items.removeLast()
        }
    }
    
    func isValid(_ s: String) -> Bool {
        //guard s.count % 2 == 0 else { return false }
        let openBrackets: [Character] = ["{","[","("]
        let closedBracketDict: [Character: Character] = ["}": "{","]" : "[",")": "("]
        var stack = Stack()
        for char in s {
            if openBrackets.contains(char){
                stack.push(char)
            } else {
                if let removedChar = stack.pop(){
                    if removedChar != closedBracketDict[char] {
                        return false
                    }
                } else {
                    return false
                }
            }
        }
        if stack.items.count == 0 {
            return true
        } else {
            return false
        }
    }
}




//let s = "(]"
//let s = "]"
//let s = "()[]{}"
//let s = "()"
let s = "(("

let solution = Solution()
print(solution.isValid(s))

