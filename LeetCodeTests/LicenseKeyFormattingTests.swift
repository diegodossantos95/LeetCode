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
        var license = S.split(separator: "-").joined()
        let dashesCount = (Double(license.count) / Double(K)).rounded(.up)
        let parts = Int(dashesCount) - 1
        
        if dashesCount > 1 {
            for part in 1...parts {
                let offset = (K * part * -1) - (part - 1)
                
                license.insert("-", at: license.index(license.endIndex, offsetBy: offset))
            }
        }
        
        return license.uppercased()
    }
    
    func tests() throws {
        XCTAssertEqual(self.licenseKeyFormatting("5F3Z-2e-9-w", 4), "5F3Z-2E9W")
        XCTAssertEqual(self.licenseKeyFormatting("2-5g-3-J", 2), "2-5G-3J")
        XCTAssertEqual(self.licenseKeyFormatting("r", 1), "R")
        XCTAssertEqual(self.licenseKeyFormatting("a0001afds-", 4), "A-0001-AFDS")
    }
}
