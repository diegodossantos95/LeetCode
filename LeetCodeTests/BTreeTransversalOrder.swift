//
//  BTreeTransversalOrder.swift
//  LeetCodeTests
//
//  Created by Diego Dos Santos on 31/05/21.
//

import XCTest
@testable import LeetCode

//102. Binary Tree Level Order Traversal
class BTreeTransversalOrder: XCTestCase {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }

        var result = [[Int]]()
        var queue = [root]

        while !queue.isEmpty {
            var tempQueue = queue
            var level = [Int]()

            queue = []

            while !tempQueue.isEmpty {
                let node = tempQueue.removeFirst()
                level.append(node.val)

                if let left = node.left {
                    queue.append(left)
                }

                if let right = node.right {
                    queue.append(right)
                }
            }

            result.append(level)
        }

        return result
    }

    func tests() throws {
        XCTAssertEqual(self.levelOrder(nil), [])
        XCTAssertEqual(self.levelOrder(.init(1)), [[1]])
        XCTAssertEqual(self.levelOrder(getFirstTree()), [[3],[9,20],[15,7]])
        XCTAssertEqual(self.levelOrder(getSecondTree()), [[1],[2]])
        XCTAssertEqual(self.levelOrder(getThirdTree()), [[1],[2,3],[4,5]])
    }

    private func getFirstTree() -> TreeNode {
        let tree7 = TreeNode(7)
        let tree15 = TreeNode(15)
        let tree20 = TreeNode(20, tree15, tree7)
        let tree9 = TreeNode(9)
        let tree3 = TreeNode(3, tree9, tree20)

        return tree3
    }

    private func getSecondTree() -> TreeNode {
        let tree9 = TreeNode(2)
        let tree3 = TreeNode(1, tree9, nil)

        return tree3
    }

    private func getThirdTree() -> TreeNode {
        let tree7 = TreeNode(5)
        let tree15 = TreeNode(4)
        let tree20 = TreeNode(3, nil, tree7)
        let tree9 = TreeNode(2, tree15, nil)
        let tree3 = TreeNode(1, tree9, tree20)

        return tree3
    }
}

class TreeNode {
  public var val: Int
  public var left: TreeNode?
  public var right: TreeNode?
  public init() { self.val = 0; self.left = nil; self.right = nil; }
  public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
  public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
      self.val = val
      self.left = left
      self.right = right
  }
}
