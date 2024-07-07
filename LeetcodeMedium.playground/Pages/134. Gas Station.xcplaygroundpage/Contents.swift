// First attempt
//class Solution {
//    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
//        let n = gas.count
//        for s in 0..<n {
//            var tank = gas[s]
//            for i in 1...n {
//                var next = (s+i) % n
//                var curr = (s+i-1) % n
//                tank -= cost[curr]
//                if tank < 0 { break }
//                tank += gas[next]
//                if i == n { return s }
//            }
//        }
//        return -1
//    }
//}

// O(n)
class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var totalGain = 0
        var currentGain = 0
        var ans = 0
        let n = gas.count
        for i in 0..<n {
            let gain = gas[i] - cost[i]
            totalGain += gain
            currentGain += gain
            if currentGain <= 0 {
                currentGain = 0
                ans = i+1
            }
        }
        return totalGain < 0 ? -1 : ans % n
        
    }
}

var gas = [1,2,3,4,5]
var cost = [3,4,5,1,2]

print(Solution().canCompleteCircuit(gas, cost))
