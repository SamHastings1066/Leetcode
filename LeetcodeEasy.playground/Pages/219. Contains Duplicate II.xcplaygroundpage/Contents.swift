class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var seen = [Int:Int]()
        for (idx, num) in nums.enumerated() {
            if let lastIdx = seen[num], idx - lastIdx <= k {
                return true
            }
            seen[num] = idx
        }
        return false
    }
}
