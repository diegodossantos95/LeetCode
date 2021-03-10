//
//  File.swift
//  LeetCodeTests
//
//  Created by dos Santos, Diego on 10/03/21.
//

import XCTest
@testable import LeetCode

class MaxUniqueLength: XCTestCase {
    func maxLength(_ arr: [String]) -> Int {
        if arr.count == 1 {
            return arr.first!.count
        }
        
        var maxLength = -1
        
        recMaxLength(arr: arr, maxLength: &maxLength)
        
        return maxLength
    }
    
    func  recMaxLength(arr: [String], index: Int = 0, text: String = "", maxLength: inout Int) {
        if arr.count == index {
            maxLength = max(uniqueCount(word: text), maxLength)
            return
        } else {
            recMaxLength(arr: arr, index: index+1, text: text, maxLength: &maxLength)
            recMaxLength(arr: arr, index: index+1, text: text + arr[index], maxLength: &maxLength)
        }
    }
    
    func uniqueCount(word: String) -> Int {
        var dict = [Character:Int]()

        for char in word {
            if dict[char] != nil {
                return -1
            } else {
                dict[char] = 1
            }
        }

        return word.count
    }
    
    func tests() throws {
        XCTAssertEqual(self.maxLength(["un", "iq", "ue"]), 4)
        XCTAssertEqual(self.maxLength(["cha","r","act","ers"]), 6)
        XCTAssertEqual(self.maxLength(["abcdefghijklmnopqrstuvwxyz"]), 26)
    }
}
