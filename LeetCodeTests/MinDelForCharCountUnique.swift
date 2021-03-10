//
//  MinDelForCharCountUnique.swift
//  LeetCodeTests
//
//  Created by dos Santos, Diego on 10/03/21.
//

import XCTest
@testable import LeetCode

//Minimum Deletions to Make Character Frequencies Unique
class MinDelForCharCountUnique: XCTestCase {
    func minDeletions(_ s: String) -> Int {
        var count = 0
        var dict = [Character: Int]()
        var set = Set<Int>()

        //Count every char
        for char in s {
            dict[char] = (dict[char] ?? 0) + 1
        }
        
        for key in dict.keys {
            var keyCount = dict[key]!
            
            while set.contains(keyCount) {
                count += 1
                keyCount -= 1
            }
            
            if keyCount > 0 {
                set.insert(keyCount)
            }
        }
        
        return count
    }
    
    
    func tests() throws {
        XCTAssertEqual(self.minDeletions("aabbccdd"), 5)
        XCTAssertEqual(self.minDeletions("aab"), 0)
        XCTAssertEqual(self.minDeletions("aaabbbcc"), 2)
        XCTAssertEqual(self.minDeletions("ceabaacb"), 2)
    }
}
