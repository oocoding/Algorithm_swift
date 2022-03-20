//
//  DoublyLinkedListTests.swift
//  AlgorithmTests
//
//  Created by Zhang Xiangxiong on 2022/3/21.
//

import XCTest
@testable import Algorithm

class DoublyLinkedListTests: XCTestCase {

    func test_init_headAndTailShouldBeNil() {
        let sut = makeSUT()
        
        XCTAssertEqual(sut.head, nil)
        XCTAssertEqual(sut.tail, nil)
        XCTAssertEqual(sut.isEmpty, true)
    }
    
    
    
    func makeSUT() -> DoublyLinkedList<Int> {
        
        return DoublyLinkedList<Int>()
    }
}
