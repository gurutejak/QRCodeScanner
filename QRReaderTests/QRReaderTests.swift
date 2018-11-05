//
//  QRReaderTests.swift
//  QRReaderTests
//
//  Created by Teja Ketepalle on 05/11/18.
//  Copyright © 2018 Teja Ketepalle. All rights reserved.
//

import XCTest
@testable import QRReader

class QRReaderTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    let vm = ViewModel()
    
    func testLabelText() {
        let expectedText = "Hello World"
        let actualText = vm.getLabelText()
        XCTAssert(expectedText ==  actualText)
    }

}
