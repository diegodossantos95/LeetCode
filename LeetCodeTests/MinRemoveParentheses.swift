//
//  MinRemoveParentheses.swift
//  LeetCodeTests
//
//  Created by Diego Dos Santos on 27/05/21.
//

import XCTest
@testable import LeetCode

//Minimum Remove to Make Valid Parentheses
class MinRemoveParentheses: XCTestCase {
    func minRemoveToMakeValid(_ s: String) -> String {
        var result = s
        let openChar = Character("(")
        let closeChar = Character(")")
        var charStack = [(Int, Character)]()

        for (index, char) in s.enumerated() {
            if char == openChar {
                charStack.append((index, char))
            } else if char == closeChar {
                if charStack.last?.1 == openChar {
                    charStack.removeLast()
                } else {
                    charStack.append((index, char))
                }
            }
        }

        for (charIndex, _) in charStack {
            let index = charIndex - (s.count - result.count) //Get index after the remove was executed and the Result was changed
            let stringIndex = result.index(result.startIndex, offsetBy: index)
            result.remove(at: stringIndex)
        }

        return result
    }

    func tests() throws {
        XCTAssertEqual(self.minRemoveToMakeValid("lee(t(c)o)de)"), "lee(t(c)o)de")
        XCTAssertEqual(self.minRemoveToMakeValid("a)b(c)d"), "ab(c)d")
        XCTAssertEqual(self.minRemoveToMakeValid("))(("), "")
        XCTAssertEqual(self.minRemoveToMakeValid("(a(b(c)d)"), "a(b(c)d)")
    }
}
