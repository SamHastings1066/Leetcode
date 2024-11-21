func sortArray(_ arr: [Int]) -> [Int] {
    func quickSort(_ arr: inout [Int], _ lo: Int, _ hi: Int) {
        if lo < hi {
            let partitionIdx = partition(&arr, lo, hi)
            quickSort(&arr, lo, partitionIdx - 1)
            quickSort(&arr, partitionIdx + 1, hi)
        }
    }
    
    func partition(_ arr: inout [Int], _ lo: Int, _ hi: Int) -> Int {
        let pivot = arr[hi]
        var iFL = lo
        var iFR = hi - 1
        while iFL <= iFR {
            if arr[iFL] <= pivot {
                iFL += 1
            } else if arr[iFR] >= pivot {
                iFR -= 1
            } else {
                (arr[iFL], arr[iFR]) = (arr[iFR], arr[iFL])
                iFL += 1
                iFR -= 1
            }
        }
        (arr[hi], arr[iFL]) = (arr[iFL], arr[hi])
        return iFL
    }
    var arr = arr
    quickSort(&arr, 0, arr.count - 1)
    return arr
}

import XCTest

class SortArrayTests: XCTestCase {
    func test_sortArray_sortsArrayOfDistinctIntegers() {
        let arr = [8,3,5,7,4,2,1,9,6]
        let res = sortArray(arr)
        XCTAssertEqual(res, [1,2,3,4,5,6,7,8,9])
    }
    
    func test_sortArray_sortsEmptyArray() {
        let arr: [Int] = []
        let res = sortArray(arr)
        XCTAssertEqual(res, [])
    }
    
    func test_sortArray_sortsArrayWithRepeatedIntegers() {
        let arr: [Int] = [4,1,4]
        let res = sortArray(arr)
        XCTAssertEqual(res, [1,4,4])
    }
    
    func test_sortArray_sortsArrayWithNegativeIntegers() {
        let arr: [Int] = [4,-1,-3]
        let res = sortArray(arr)
        XCTAssertEqual(res, [-3,-1,4])
    }
}

SortArrayTests.defaultTestSuite.run()
