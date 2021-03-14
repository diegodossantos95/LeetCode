//
//  PartitionEqualSumSubsets.swift
//  LeetCodeTests
//
//  Created by dos Santos, Diego on 10/03/21.
//

import XCTest
@testable import LeetCode

//Partition to K Equal Sum Subsets
class PartitionEqualSumSubsets: XCTestCase {
    func canPartitionKSubsets(_ nums: [Int], _ k: Int) -> Bool {
        let sum = nums.reduce(0, +)
        
        if sum % k != 0 {
            return false
        }
        
        return false
    }
    
    private func canPartition(_ nums: [Int]) -> Bool {
        return false
    }
    
    func tests() throws {
        XCTAssertEqual(self.canPartitionKSubsets([4, 3, 2, 3, 5, 2, 1], 4), true)
    }
}
