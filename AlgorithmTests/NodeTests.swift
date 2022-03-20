//
//  NodeTests.swift
//  AlgorithmTests
//
//  Created by Zhang Xiangxiong on 2022/3/20.
//

import XCTest
@testable import Algorithm

class NodeTests: XCTestCase {

    
    func test_init_nextShouldBeNil() {
        let sut = makeSUT(value: 3)
        
        XCTAssertNil(sut.next)
        XCTAssertEqual(sut.value, 3)
    }
    
    func makeSUT(value:Int = 0) -> Node<Int> {
        Node(value: value)
    }
}
