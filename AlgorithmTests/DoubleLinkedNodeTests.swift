//
//  DoubleLinkedNodeTests.swift
//  AlgorithmTests
//
//  Created by Zhang Xiangxiong on 2022/3/21.
//

import XCTest
@testable import Algorithm

class DoubleLinkedNodeTests: XCTestCase {

    func test_init_() {
        let sut = makeSUT(value: 1)
        
        XCTAssertEqual(sut.value, 1)
        XCTAssertEqual(sut.next, nil)
        XCTAssertEqual(sut.previous , nil)
    }
    
    func makeSUT(value:Int = 0) -> DoubleLinkedNode<Int> {
        return DoubleLinkedNode(value: value)
    }

}
