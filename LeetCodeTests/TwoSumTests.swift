//
//  LeetCodeTests.swift
//  LeetCodeTests
//
//  Created by dos Santos, Diego on 06/03/21.
//

import XCTest
@testable import LeetCode

class LeetCodeTests: XCTestCase {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        
        for (index, number) in nums.enumerated() {
            
            // Checks if the current number is the diff from another iteration
            if let previousIndex = dict[number] {
                return [previousIndex, index]
            }
            
            // Store the diff of target and the current number of this iteration
            dict[target - number] = index
        }
        
        return []
    }
    
    func tests() throws {
        XCTAssertEqual(self.twoSum([2,7,11,15], 9), [0,1])
        XCTAssertEqual(self.twoSum([3,2,4], 6), [1,2])
        XCTAssertEqual(self.twoSum([3,3], 6), [0,1])
    }
}
