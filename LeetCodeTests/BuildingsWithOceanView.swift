//
//  BuildingsWithOceanView.swift
//  LeetCodeTests
//
//  Created by Diego Dos Santos on 01/06/21.
//

import XCTest
@testable import LeetCode

//1762.Buildings With an Ocean View
class BuildingsWithOceanView: XCTestCase {
    func findBuildings(_ heights: [Int]) -> [Int] {
        guard !heights.isEmpty else {
            return []
        }

        var buildings = [Int]()
        var tallest = 0

        for index in (0...heights.count-1).reversed() { //reversed the bounds
            let height = heights[index]
            if height > tallest {
                tallest = height
                buildings.append(index)
            }
        }

        return buildings.reversed()
    }

    func tests() throws {
        XCTAssertEqual(self.findBuildings([]), [])
        XCTAssertEqual(self.findBuildings([4,2,3,1]), [0,2,3])
        XCTAssertEqual(self.findBuildings([4,3,2,1]), [0,1,2,3])
        XCTAssertEqual(self.findBuildings([1,2,3,4]), [3])
    }
}
