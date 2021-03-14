//
//  Fibonacci.swift
//  LeetCodeTests
//
//  Created by dos Santos, Diego on 14/03/21.
//

import XCTest
@testable import LeetCode

//Fibonacci Number
class Fibonacci: XCTestCase {
    func fib(_ n: Int) -> Int {
        guard n > 1 else {
            return n
        }
        
        return fib(n-1) + fib(n-2)
    }
    
    private var cache = [Int: Int]()

    func fibWithCache(_ n: Int) -> Int {
        guard n > 1 else {
            return n
        }
        
        if let value = cache[n] {
            return value
        } else {
            let result = fibWithCache(n-1) + fibWithCache(n-2)
            cache[n] = result
            return result
        }
    }
    
    func tests() throws {
        XCTAssertEqual(self.fib(2), 1)
        XCTAssertEqual(self.fib(3), 2)
        XCTAssertEqual(self.fib(4), 3)
        XCTAssertEqual(self.fib(10), 55)
    }
    
    func testsWithCache() throws {
        XCTAssertEqual(self.fibWithCache(2), 1)
        XCTAssertEqual(self.fibWithCache(3), 2)
        XCTAssertEqual(self.fibWithCache(4), 3)
        XCTAssertEqual(self.fibWithCache(10), 55)
    }
}
