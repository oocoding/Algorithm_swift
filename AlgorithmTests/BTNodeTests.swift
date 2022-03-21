//
//  BTNodeTests.swift
//  AlgorithmTests
//
//  Created by Zhang Xiangxiong on 2022/3/21.
//

import XCTest
@testable import Algorithm

class BTNodeTests: XCTestCase {

    func test_inorder() {
        let rootNode = makeSUT()

        // 3 9 12 15 17 23 28
        BTNode.inOrderTraversal(rootNode)
        print()
    }

    
    func test_inOrderTraversal() {
        let rootNode = makeSUT()
        
        // 15 9 3 12 23 17 28
        BTNode.preOrderTraversal(rootNode)
        print()
    }
    
    
    func test_postOrderTraversal() {
        let rootNode = makeSUT()
        
        // 3 12 9 17 28 23 15
        BTNode.postOrderTraversal(rootNode)
        print()
    }
    
    func makeSUT() -> BTNode<Int> {
        let node3 = BTNode(3,nil,nil)
        let node12 = BTNode(12,nil,nil)
        let node17 = BTNode(17,nil,nil)
        let node28 = BTNode(28,nil,nil)
        let node9 = BTNode(9,node3,node12)
        let node23 = BTNode(23,node17,node28)
        let root = BTNode(15,node9,node23)
        
        return root
    }
}
