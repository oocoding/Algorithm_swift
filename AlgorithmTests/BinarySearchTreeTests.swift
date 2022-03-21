//
//  BinarySearchTreeTests.swift
//  AlgorithmTests
//
//  Created by Zhang Xiangxiong on 2022/3/21.
//

import XCTest
@testable import Algorithm

class BinarySearchTreeTests: XCTestCase {

//    func test_insert_intoEmptyTree() {
//        let sut = makeSUT()
//
//        sut.insert(insertedValue: 1)
//
//        XCTAssertEqual(sut.root?.value, 1)
//    }
    
    
    func test_search_() {
        let sut = makeSUT(values: [0,1,2,3,4])
        
        
        print(sut.searchValue(4))
        
    }
    
    private func makeSUT(values:[Int] = []) -> BinarySearchTree<Int> {
        
        if values.count > 0 {
            let tree = BinarySearchTree<Int>()
            
            let _ = values.reduce(tree) { tree, value in
                tree.insert(insertedValue: value)
                return tree
            }
            return tree
        } else {
            return makeMockTree()
        }
    }
    
    
    func test_minValue() {
        let sut = makeSUT()
        print(sut.root!)
        
        print(sut.root!.min)
    }
    
    private func makeMockTree() -> BinarySearchTree<Int> {
        
        let node0 = BTNode(0, nil, nil)
        let node4 = BTNode(4, nil, nil)
        let node6 = BTNode(6, nil, nil)
        let node13 = BTNode(13, nil, nil)
        
        let node17 = BTNode(17, nil, nil)
        let node28 = BTNode(28, nil, nil)
        let node23 = BTNode(23, node17, node28)
        
        let node3 = BTNode(3, node0, node4)
        let node12 = BTNode(12, node6, node13)
        
        let node9 = BTNode(9, node3, node12)
        
        let node15 = BTNode(15, node9, node23)
        
        return BinarySearchTree<Int>(rootNode: node15)
    }
}
