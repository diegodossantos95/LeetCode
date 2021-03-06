//
//  LicenseKeyFormatting.swift
//  LeetCodeTests
//
//  Created by dos Santos, Diego on 06/03/21.
//

import XCTest
@testable import LeetCode

class LicenseKeyFormattingTests: XCTestCase {
    func licenseKeyFormatting(_ S: String, _ K: Int) -> String {
        let license = S.split(separator: "-").joined().reversed()
        var result = ""
        
        for (index, char) in license.enumerated() {
            if index % K == 0 && index != 0 {
                result = "\(char)-\(result)"
            } else {
                result = "\(char)\(result)"
            }
        }
        
        return result.uppercased()
    }
    
    func tests() throws {
        XCTAssertEqual(self.licenseKeyFormatting("5F3Z-2e-9-w", 4), "5F3Z-2E9W")
        XCTAssertEqual(self.licenseKeyFormatting("2-5g-3-J", 2), "2-5G-3J")
        XCTAssertEqual(self.licenseKeyFormatting("r", 1), "R")
        XCTAssertEqual(self.licenseKeyFormatting("a0001afds-", 4), "A-0001-AFDS")
    }
}
