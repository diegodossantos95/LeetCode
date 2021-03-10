//
//  JumpGame3.swift
//  LeetCodeTests
//
//  Created by dos Santos, Diego on 10/03/21.
//

import XCTest
@testable import LeetCode

//Jump Game III
class JumpGame3: XCTestCase {
    func canReach(_ arr: [Int], _ start: Int) -> Bool {
        var reachable = false
        var visited = Set<Int>()
        
        self.reach(arr: arr, index: start, reachable: &reachable, visited: &visited)
        
        return reachable
    }
    
    private func reach(arr: [Int], index: Int, reachable: inout Bool, visited: inout Set<Int>) {
        guard index >= 0 && index < arr.count && !visited.contains(index) else {
            return
        }
        
        let value = arr[index]
        visited.insert(index)
        
        if value == 0 {
            reachable = true
            return
        } else {
            reach(arr: arr, index: index+value, reachable: &reachable, visited: &visited)
            reach(arr: arr, index: index-value, reachable: &reachable, visited: &visited)
        }
    }
    
    func tests() throws {
        XCTAssertEqual(self.canReach([4,2,3,0,3,1,2], 5), true)
        XCTAssertEqual(self.canReach([4,2,3,0,3,1,2], 0), true)
        XCTAssertEqual(self.canReach([3,0,2,1,2], 2), false)
    }
}
