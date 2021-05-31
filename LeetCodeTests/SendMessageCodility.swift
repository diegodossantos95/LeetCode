//
//  SendMessageCodility.swift
//  LeetCodeTests
//
//  Created by dos Santos, Diego on 06/03/21.
//

import XCTest
@testable import LeetCode

class SendMessageCodility: XCTestCase {
    func sendMessage(_ S : String, _ A : [Int]) -> String {
        let chars = Array(S)
        var message = ""
        var index = 0
        
        repeat {
            message = "\(message)\(chars[index])"
            index = A[index]
        }
        while (index != 0)
        
        return message
    }
    
    func tests() throws {
        XCTAssertEqual(self.sendMessage("c", [0]), "c")
        XCTAssertEqual(self.sendMessage("cdeo", [3,2,0,1]), "code")
        XCTAssertEqual(self.sendMessage("cdeenetpi", [5, 2, 0, 1, 6, 4, 8, 3, 7]), "centipede")
    }
}
