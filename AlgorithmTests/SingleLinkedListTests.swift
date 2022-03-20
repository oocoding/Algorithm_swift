//
//  SingleLinkedListTests.swift
//  AlgorithmTests
//
//  Created by Zhang Xiangxiong on 2022/3/20.
//

import XCTest
@testable import Algorithm

class SingleLinkedListTests: XCTestCase {
    
    let node1 = Node(value: 1)
    let node2 = Node(value: 2)
    let node3 = Node(value: 3)
    let node4 = Node(value: 4)
    
    func test_init_listIsEmpty() {
        XCTAssertEqual(makeSUT().isEmpty, true)
    }
    
    
    func test_appendOneElement() {
        let sut = makeSUT()
        
        sut.append(value: node1.value)
        
        XCTAssertEqual(sut.head, node1)
        XCTAssertEqual(sut.tail, node1)
    }
    
    
    func test_appendTwoElement() {
        let sut = makeSUT()
        
        sut.append(value: node1.value)
        sut.append(value: node2.value)
        
        XCTAssertEqual(sut.head, node1)
        XCTAssertEqual(sut.tail, node2)
        
        XCTAssertEqual(sut, makeSUT(values: [node1.value, node2.value]))
    }
    
    
    
    func test_append_withEqual() {
        let sut = makeSUT()
        
        sut.append(value: 1)
        XCTAssertEqual(sut, makeSUT(values: [1]))
        
        sut.append(value: 2)
        XCTAssertEqual(sut, makeSUT(values: [1,2]))
        
        sut.append(value: 3)
        XCTAssertEqual(sut, makeSUT(values: [1,2,3]))
        
        // break the tail. should not equal
        let tmpTail = sut.tail
        sut.tail = nil
        XCTAssertNotEqual(sut, makeSUT(values: [1,2,3]))
        
        sut.tail = tmpTail
        XCTAssertEqual(sut, makeSUT(values: [1,2,3]))
        
        
        // break the tail. should not equal
        let tmpHead = sut.head
        sut.head = nil
        XCTAssertNotEqual(sut, makeSUT(values: [1,2,3]))
        
        sut.head = tmpHead
        XCTAssertEqual(sut, makeSUT(values: [1,2,3]))
        
        // if elements is not equal. then sut is not equal.
        sut.append(value: 3)
        sut.append(value: 4)
        XCTAssertNotEqual(sut, makeSUT(values: [1,2,3,4]))
        XCTAssertEqual(sut, makeSUT(values: [1,2,3,3,4]))
    }
    
    
    
    func test_append_headAndTailShouldNotNil() {
        let sut = makeSUT()
        sut.append(value: node1.value)

        XCTAssertEqual(sut.head, node1)
        XCTAssertEqual(sut.tail, node1)
    }
    
    
    func makeSUT(values:[Int]=[]) -> SingleLinkedList<Int> {
        let list = SingleLinkedList<Int>()
        let _ = values.reduce(list) { list, value in
            list.append(value: value)
            return list
        }
        return list
    }
  
}
