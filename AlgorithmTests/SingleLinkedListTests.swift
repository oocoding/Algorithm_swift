//
//  SingleLinkedListTests.swift
//  AlgorithmTests
//
//  Created by Zhang Xiangxiong on 2022/3/20.
//

import XCTest
@testable import Algorithm

class SingleLinkedListTests: XCTestCase {

    func test_init_headAndTailShouldBeNil() {
        
        let sut = makeSUT()
        
        XCTAssertEqual(sut.isEmpty, true)
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
    }
    
    
    func test_append() {
        let sut = makeSUT()
        
        let node1 = Node(value: 1)
        
        sut.append(value: node1.value)
        XCTAssertEqual(sut.head, node1)
        XCTAssertEqual(sut.tail, node1)
        
        let node2 = Node(value: 2)
        sut.append(value: node2.value)
        XCTAssertEqual(sut.tail, node2)
        XCTAssertEqual(sut.head, node1)
        
        print(sut)
    }

    
    
    func makeSUT() -> SingleLinkedList<Int> {
        SingleLinkedList<Int>()
    }
}
