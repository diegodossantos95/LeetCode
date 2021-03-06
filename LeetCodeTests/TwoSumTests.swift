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
        
        for (index, num) in nums.enumerated() {
            for (index2, num2) in nums.enumerated() {
                if index != index2 && (num + num2) == target {
                    return [index, index2]
                }
            }
        }
        
        return []
    }
    
    func tests() throws {
        XCTAssertEqual(self.twoSum([2,7,11,15], 9), [0,1])
        XCTAssertEqual(self.twoSum([3,2,4], 6), [1,2])
        XCTAssertEqual(self.twoSum([3,3], 6), [0,1])
    }
}
