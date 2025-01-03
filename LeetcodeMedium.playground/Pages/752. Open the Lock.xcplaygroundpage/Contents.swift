class Solution {
    func openLock(_ deadends: [String], _ target: String) -> Int {
        var queue = ["0000"]
        var seen = Set<String>()
        seen.insert("0000")
        var level = 0
        let deadends = Set(deadends)
        
        while !queue.isEmpty {
            let rowLength = queue.count
            for _ in 0..<rowLength {
                let lock = queue.removeFirst()
                if lock == target { return level }
                if deadends.contains(lock) { continue }
                
                for i in 0..<4 {
                    let (rotatedUp, rotatedDown) = rotate(lock, at: i)
                    
                    if !seen.contains(rotatedUp) && !deadends.contains(rotatedUp) {
                        queue.append(rotatedUp)
                        seen.insert(rotatedUp)
                    }
                    
                    if !seen.contains(rotatedDown) && !deadends.contains(rotatedDown) {
                        queue.append(rotatedDown)
                        seen.insert(rotatedDown)
                    }
                }
            }
            level += 1
        }
        
        return -1
        
        func rotate(_ lock: String, at i: Int) -> (String, String) {
            var lockArray = Array(lock)
            
            let upDigit = (Int(String(lockArray[i]))! + 1) % 10
            let downDigit = (Int(String(lockArray[i]))! + 9) % 10
            
            lockArray[i] = Character("\(upDigit)")
            let rotatedUp = String(lockArray)
            
            lockArray[i] = Character("\(downDigit)")
            let rotatedDown = String(lockArray)
            
            return (rotatedUp, rotatedDown)
        }
    }
}
