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
    
    
    
    func test_emptyListGetNodeAtZero_shouldReturnNil() {
        let sut = makeSUT()
        
        XCTAssertEqual(sut.nodeAt(index: 0), nil)
        XCTAssertEqual(sut.nodeAt(index: 1), nil)
    }
    
    
    func test_equal_S1_S2_haveSameElements_shouldEqualToEachOther() {
        let s1 = makeSUT()
        let s2 = makeSUT()
        
        XCTAssertEqual(s1, s2)
    }
    
    func makeSUT() -> DoublyLinkedList<Int> {
        
        return DoublyLinkedList<Int>()
    }
}
