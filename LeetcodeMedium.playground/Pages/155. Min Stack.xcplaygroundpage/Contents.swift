
class MinStack {
    
    var stack: [[Int]]
    var end: Int { stack.count - 1 }
    init() {
        stack = []
    }
    
    func push(_ val: Int) {
        if stack.isEmpty {
            stack.append([val, val])
        } else {
            var currMin = stack[end][1]
            if val < currMin { currMin = val }
            stack.append([val, min(currMin, val)])
        }
   
    }
    
    func pop() {
        stack.removeLast()
    }
    
    func top() -> Int {
        stack[end][0]
    }
    
    func getMin() -> Int {
        stack[end][1]
    }
}

var stack = MinStack()
stack.push(-2)
stack.push(0)
stack.push(-3)
print(stack.getMin())
stack.pop()
print(stack.top())
print(stack.getMin())

