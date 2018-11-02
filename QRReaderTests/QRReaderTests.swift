//
//  QRReaderTests.swift
//  QRReaderTests
//
//  Created by Teja Ketepalle on 02/11/18.
//  Copyright © 2018 Teja Ketepalle. All rights reserved.
//

import XCTest
@testable import QRReader

class QRReaderTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    let vm = ViewModel()
    
    func testLabelText() {
        let expectedText = "Hello World"
        let actualText = vm.getLabelText()
        XCTAssert(expectedText ==  actualText)
    }

}
