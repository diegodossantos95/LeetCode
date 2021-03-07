//
//  Task3.swift
//  LeetCodeTests
//
//  Created by dos Santos, Diego on 06/03/21.
//

import XCTest
@testable import LeetCode

class Tree {
    var x: Int = 0
    var l: Tree?
    var r: Tree?
}

class CountVisibleNodesInTree: XCTestCase {
    //https://www.geeksforgeeks.org/count-the-number-of-visible-nodes-in-binary-tree/

    func solution(_ T : Tree?) -> Int {
        var visibleNodes = 0

        navTree(tree: T, value: Int.min, visibleNodes: &visibleNodes)

        return visibleNodes
    }
    
    func navTree(tree: Tree?, value: Int, visibleNodes: inout Int) {
        guard let tree = tree else {
            return
        }

        var maxValue = value

        if (tree.x >= value) {
            visibleNodes+=1
            maxValue = tree.x
        }

        navTree(tree: tree.l, value: maxValue, visibleNodes: &visibleNodes)
        navTree(tree: tree.r, value: maxValue, visibleNodes: &visibleNodes)
    }
    
    func tests() throws {
        XCTAssertEqual(self.solution(generate1stTree()), 4)
        XCTAssertEqual(self.solution(generate2ndTree()), 1)
        XCTAssertEqual(self.solution(nil), 0)
    }
    
    private func generate1stTree() -> Tree {
        /*
               5
              /  \
            3     10
           /  \   /
          20   21 1
       */
        
        let root = Tree()
        root.x = 5
        root.l = Tree()
        root.l?.x = 3
        root.l?.l = Tree()
        root.l?.l?.x = 20
        root.l?.r = Tree()
        root.l?.r?.x = 21
        
        root.r = Tree()
        root.r?.x = 10
        root.r?.l = Tree()
        root.r?.l?.x = 1
        
        return root
    }
    
    private func generate2ndTree() -> Tree {
        /*
         -1
           \
            -2
              \
               -3
       */
        
        let root = Tree()
        root.x = -1
        root.r = Tree()
        root.r?.x = -2
        root.r?.r = Tree()
        root.r?.r?.x = -3
        
        return root
    }
}



