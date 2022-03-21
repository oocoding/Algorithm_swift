//
//  TreeNodeTests.swift
//  AlgorithmTests
//
//  Created by Zhang Xiangxiong on 2022/3/21.
//

import XCTest
@testable import Algorithm

class TreeNodeTests: XCTestCase {


    func test_init_() {
        let root = TreeNode(data: 1)
        
        let level1Node1 = createNode(parentNode: root, data: 11)
        let level1Node2 = createNode(parentNode: root, data: 12)
        let level1Node3 = createNode(parentNode: root, data: 13)
        
        let level2Node1 = createNode(parentNode: level1Node1, data: 21)
        let level2Node2 = createNode(parentNode: level1Node1, data: 22)

        root.printTree()
        print("---")
        let n_11 = root.search(data: 11)
        n_11?.printTree()
    }
    
    
    private func createNode(parentNode: TreeNode<Int>, data: Int) -> TreeNode<Int> {
        
        let newNode = TreeNode<Int>(data: data)
        parentNode.children.append(newNode)
        newNode.parent = parentNode
        
        return newNode
    }
}
