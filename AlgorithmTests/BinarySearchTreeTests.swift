//
//  BinarySearchTreeTests.swift
//  AlgorithmTests
//
//  Created by Zhang Xiangxiong on 2022/3/21.
//

import XCTest
@testable import Algorithm

class BinarySearchTreeTests: XCTestCase {

    func test_insert_intoEmptyTree() {
        let sut = makeSUT()
        
        sut.insert(insertedValue: 1)
        
        XCTAssertEqual(sut.root?.value, 1)
    }
    
    
    func test_search_() {
        let sut = makeSUT(values: [0,1,2,3,4])
        
        
        sut.searchValue(4)
        
    }
    
    private func makeSUT(values:[Int] = []) -> BinarySearchTree<Int> {
        
        let tree = BinarySearchTree<Int>()
        
        let _ = values.reduce(tree) { tree, value in
            tree.insert(insertedValue: value)
            return tree
        }
        return tree
    }
}
