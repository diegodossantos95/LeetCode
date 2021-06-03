//
//  SimplifyPath.swift
//  LeetCodeTests
//
//  Created by Diego Dos Santos on 02/06/21.
//

import XCTest
@testable import LeetCode

//71. Simplify Path
class SimplifyPath: XCTestCase {
    func simplifyPath(_ path: String) -> String {
        let splitPath = path.split(separator: "/")
        var paths = [String]()
        var canonicalPath = "/"

        for split in splitPath {
            if split == ".." && !paths.isEmpty {
                paths.removeLast()
            } else if split != "." && split != ".." {
                paths.append(String(split))
            }
        }

        canonicalPath.append(paths.joined(separator: "/"))

        return canonicalPath
    }

    func tests() throws {
        XCTAssertEqual(self.simplifyPath("/home/"), "/home")
        XCTAssertEqual(self.simplifyPath("/../"), "/")
        XCTAssertEqual(self.simplifyPath("/home//foo/"), "/home/foo")
        XCTAssertEqual(self.simplifyPath("/a/./b/../../c/"), "/c")
        XCTAssertEqual(self.simplifyPath("/a//b////c/d//././/.."), "/a/b/c")
    }
}
