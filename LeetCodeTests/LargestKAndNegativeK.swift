//
//  LargestKAndNegativeK.swift
//  LeetCodeTests
//
//  Created by dos Santos, Diego on 10/03/21.
//

import XCTest
@testable import LeetCode

//Largest K such that both K and -K exist in array
class LargestKAndNegativeK: XCTestCase {
    func getLargest(_ arr: [Int]) -> Int {
        let numbers = arr.sorted()
        let setNumbers = Set(numbers)
        
        for number in numbers {
            if setNumbers.contains(-number) {
                return -number
            }
        }
        
        return 0
    }
    
    func tests() throws {
        XCTAssertEqual(self.getLargest([3, 2, -2, 5, -3]), 3)
        XCTAssertEqual(self.getLargest([1, 2, 3, -4]), 0)
    }
}
