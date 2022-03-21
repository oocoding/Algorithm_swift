//
//  QueueByArrayTests.swift
//  AlgorithmTests
//
//  Created by Zhang Xiangxiong on 2022/3/21.
//

import XCTest
@testable import Algorithm

class QueueByArrayTests: XCTestCase {

    func test_enqueue() {
        let sut = makeSUT()
        
        XCTAssertEqual(sut.isEmpty, true)
        XCTAssertEqual(sut.isFull, false)
        
        XCTAssertEqual(sut.enqueue(0), true)
        XCTAssertEqual(sut.isEmpty, false)
        XCTAssertEqual(sut.isFull, false)
        
        XCTAssertEqual(sut.enqueue(1), true)
        XCTAssertEqual(sut.isEmpty, false)
        XCTAssertEqual(sut.isFull, true)
        
        XCTAssertEqual(sut.enqueue(1), false)
        XCTAssertEqual(sut.isEmpty, false)
        XCTAssertEqual(sut.isFull, true)
        
        XCTAssertEqual(sut.dequeue(), 0)
        XCTAssertEqual(sut.dequeue(), 1)
        XCTAssertEqual(sut.isFull, false)
        XCTAssertEqual(sut.isEmpty, true)
        XCTAssertEqual(sut.dequeue(), nil)
        XCTAssertEqual(sut.enqueue(3), true)
        XCTAssertEqual(sut.dequeue(), 3)
    }
    
    func makeSUT() -> QueueByArray<Int> {
        return QueueByArray<Int>(capacity: 2)
    }
}
