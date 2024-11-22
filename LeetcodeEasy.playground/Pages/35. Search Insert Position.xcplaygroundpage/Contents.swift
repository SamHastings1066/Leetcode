class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var l = 0
        var r = nums.count - 1
        while l <= r {
            let mid = (l+r)/2
            if nums[mid] == target {
                return mid
            } else if nums[mid] > target {
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
        return l
    }
}

import XCTest

class SearchInsertTests: XCTestCase {
    func test_searchInsert_findsIndexOfTargetWhenPresentInNums() {
        let nums = [1,3,5,6]
        let target = 5
        XCTAssertEqual(Solution().searchInsert(nums, target), 2)
    }
    
    func test_searchInsert_findsIndexOfTargetWhenNotPresentInNums() {
        let nums = [1,3,5,6]
        let target = 2
        XCTAssertEqual(Solution().searchInsert(nums, target), 1)
    }
    
    func test_searchInsert_findsIndexOfTargetWhenSmallerThanNumsStartVal() {
        let nums = [1,3,5,6]
        let target = 0
        XCTAssertEqual(Solution().searchInsert(nums, target), 0)
    }
}

SearchInsertTests.defaultTestSuite.run()

