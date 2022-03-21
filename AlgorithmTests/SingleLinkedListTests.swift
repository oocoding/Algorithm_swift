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
    
    func test_init_itemsShouldBeEmpty() {
        XCTAssertEqual(makeSUT().isEmpty, true)
    }
    
    
    func test_appendOneElement_headAndTailShouldPointToTheNode() {
        let sut = makeSUT()
        
        sut.append(value: node1.value)
        
        XCTAssertEqual(sut.head, node1)
        XCTAssertEqual(sut.tail, node1)
    }
    
    
    func test_appendTwoElement_headShouldPointToTheFirst_tailShouldPointToSec() {
        let sut = makeSUT()
        
        sut.append(value: node1.value)
        sut.append(value: node2.value)
        
        XCTAssertEqual(sut.head, node1)
        XCTAssertEqual(sut.tail, node2)
        
        XCTAssertEqual(sut, makeSUT(values: [node1.value, node2.value]))
    }
    
    
    
    func test_append_checkElementsInTheList() {
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
        
        
        // break the head. should not equal
        let tmpHead = sut.head
        sut.head = nil
        XCTAssertNotEqual(sut, makeSUT(values: [1,2,3]))
        
        sut.head = tmpHead
        XCTAssertEqual(sut, makeSUT(values: [1,2,3]))
        
        // if elements are not equal. then suts are not equal to each other.
        sut.append(value: 3)
        sut.append(value: 4)
        XCTAssertNotEqual(sut, makeSUT(values: [1,2,3,4]))
        XCTAssertEqual   (sut, makeSUT(values: [1,2,3,3,4]))
    }
    
    
    func test_insertAtIndex_checkElementsWithEqual() {
        
        let sut = makeSUT()
        
        XCTAssertEqual(sut.insert(at: 1, value: 1), false)
        XCTAssertEqual(sut, makeSUT(values: []))
        
        XCTAssertEqual(sut.insert(at: 0, value: 1), true)
        XCTAssertEqual(sut, makeSUT(values: [1]))
        
        XCTAssertEqual(sut.insert(at: 2, value: 2), false)
        XCTAssertEqual(sut, makeSUT(values: [1]))
        
        XCTAssertEqual(sut.insert(at: 1, value: 2), true)
        XCTAssertEqual(sut, makeSUT(values: [1,2]))
        
        XCTAssertEqual(sut.insert(at: 0, value: 0), true)
        XCTAssertEqual(sut, makeSUT(values: [0,1,2]))
    }
    
    private func makeSUT(values:[Int], andInsert value:Int, at index: Int) -> SingleLinkedList<Int> {
        let sut = makeSUT(values: values)
        
        let _ = sut.insert(at: index, value: value)
        
        return sut
    }
    
    
    func test_append_headAndTailShouldNotNil() {
        let sut = makeSUT()
        sut.append(value: node1.value)

        XCTAssertEqual(sut.head, node1)
        XCTAssertEqual(sut.tail, node1)
    }
    
    
    
    func test_removeLast_checkReturnValue() {
  
        XCTAssertEqual(makeSUT().removeLast(), nil)
        XCTAssertEqual(makeSUT(values: [1]).removeLast(), 1)
        XCTAssertEqual(makeSUT(values: [1,2]).removeLast(), 2)
    }
    
    func test_removeLast_checkElements() {
        
        let sut = makeSUT(values: [1,2,3,4])
        
        let _ = sut.removeLast()
        XCTAssertEqual(sut, makeSUT(values: [1,2,3]))

        let _ = sut.removeLast()
        XCTAssertEqual(sut, makeSUT(values: [1,2]))
        
        let _ = sut.removeLast()
        XCTAssertEqual(sut, makeSUT(values: [1]))
        
        let _ = sut.removeLast()
        XCTAssertEqual(sut.isEmpty, true)
        XCTAssertEqual(sut, makeSUT(values: []))
        
        let _ = sut.removeLast()
        XCTAssertEqual(sut, makeSUT(values: []))
    }
    
    
    
    func test_removeAt_whenIndexOutOfBounds_returnNil() {
        let sut = makeSUT()
        let removedValue = sut.remove(at: 0)
        XCTAssertEqual(removedValue, nil)
        
        sut.append(value: 1)
        let removedValue2 = sut.remove(at: 1)
        XCTAssertEqual(removedValue2, nil)
    }
    
    func test_removeAt_checkReturnsValue() {
        XCTAssertEqual(makeSUT(values: [0,1,2,3]).remove(at: 0), 0)
        XCTAssertEqual(makeSUT(values: [0,1,2,3]).remove(at: 1), 1)
        XCTAssertEqual(makeSUT(values: [0,1,2,3]).remove(at: 2), 2)
        XCTAssertEqual(makeSUT(values: [0,1,2,3]).remove(at: 3), 3)
        XCTAssertEqual(makeSUT(values: [0,1,2,3]).remove(at: 4), nil)
    }
    
    
    func test_removeAt_whenIndexInsidesBounds_leftElements() {
        // 一个元素删除头元素
        XCTAssertEqual(makeSUT(values: [], removeAt: 0), makeSUT())
        XCTAssertEqual(makeSUT(values: [1], removeAt: 0), makeSUT())
        XCTAssertEqual(makeSUT(values: [1,2], removeAt: 0), makeSUT(values: [2]))
        XCTAssertEqual(makeSUT(values: [1,2,3], removeAt: 0), makeSUT(values: [2,3]))
        
        // 一个元素删除尾元素
        XCTAssertEqual(makeSUT(values: [], removeAt: 0), makeSUT())
        XCTAssertEqual(makeSUT(values: [1], removeAt: 0), makeSUT())
        XCTAssertEqual(makeSUT(values: [1,2], removeAt: 1), makeSUT(values: [1]))
        XCTAssertEqual(makeSUT(values: [1,2,3], removeAt: 2), makeSUT(values: [1,2]))
        
        
        XCTAssertEqual(makeSUT(values: [1,2,3], removeAt: 1), makeSUT(values: [1,3]))
        XCTAssertEqual(makeSUT(values: [1,2,3,4], removeAt: 2), makeSUT(values: [1,2,4]))
    }
    
    func makeSUT(values:[Int], removeAt index:Int) -> SingleLinkedList<Int> {
        let sut = makeSUT(values: values)
        let _ = sut.remove(at: index)
        return sut
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
