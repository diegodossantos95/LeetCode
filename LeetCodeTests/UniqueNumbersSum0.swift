//
//  Task2.swift
//  LeetCodeTests
//
//  Created by dos Santos, Diego on 06/03/21.
//

import XCTest
@testable import LeetCode

//Find N Unique Integers Sum up to Zero
class UniqueNumbersSum0Tests: XCTestCase {
    func nUniqueSum0(_ N : Int) -> [Int] {
        guard N > 1 else {
            return [0]
        }
        
        var numbers = [Int]()
        
        if N % 2 != 0 {
            numbers.append(0)
        }
        
        for number in (1...(N / 2)) {
            numbers.append(number)
            numbers.append(-number)
        }
        
        
        return numbers
    }
    
    func tests() throws {
        XCTAssertEqual(self.nUniqueSum0(1), [0])
        XCTAssertEqual(self.nUniqueSum0(2), [1, -1])
        XCTAssertEqual(self.nUniqueSum0(3), [0, 1, -1])
        XCTAssertEqual(self.nUniqueSum0(4), [1, -1, 2, -2])
    }
}
