//
//  SeatClose.swift
//  LeetCodeTests
//
//  Created by Diego Dos Santos on 29/04/21.
//

import XCTest
@testable import LeetCode

/*
Challenge
Have the function SeatingStudents(arr) read the array of integers stored in arr which will be in the
following format: [K, r1, r2, r3, ...] where K represents the number of desks in a classroom,
and the rest of the integers in the array will be in sorted order and will represent the desks
 that are already occupied. All of the desks will be arranged in 2 columns,
 where desk #1 is at the top left, desk #2 is at the top right, desk #3 is below #1, desk #4 is below #2, etc.
 Your program should return the number of ways 2 students can be seated next to each other.
 This means 1 student is on the left and 1 student on the right, or 1 student is directly above or below the other student.
For example: if arr is [12, 2, 6, 7, 11] then this classrooms looks like the following diagram:
 1   (2)
 3    4
 5   (6)
(7)   8
 9    10
(11)  12
 
Based on above arrangement of occupied desks, there are a total of 6 ways ([1,3][3,4][3,5][8,10][9,10][10,12]) to seat 2 new students next to each other. The combinations are: [1, 3], [3, 4], [3, 5], [8, 10], [9, 10], [10, 12]. So for this input your program should return 6. K will range from 2 to 24 and will always be an even number. After K, the number of occupied desks in the array can range from 0 to K.
Sample Test Cases
Input:6, 4
Output:4
Input:8, 1, 8
Output:6
*/

class SeatingStudents: XCTestCase {
    func seatingStudents(_ arr: [Int]) -> Int {
      guard arr.count > 1 else {
        return 0
      }

      var combinations = 0
      let nSeats = arr[0]
      let occupied = arr.dropFirst()
      var available = [Int]()

      for seat in 1...nSeats {
        if !occupied.contains(seat) {
          if !available.isEmpty {
            if (available.contains(seat-1) && seat % 2 == 0) {
              combinations += 1
            }
            if (available.contains(seat-2)) {
              combinations += 1
            }
          }
            
          available.append(seat)
        }
      }

      return combinations
    }
    
    
    func tests() throws {
        XCTAssertEqual(self.seatingStudents([6,4]), 4)
        XCTAssertEqual(self.seatingStudents([8,1,8]), 6)
    }
}
