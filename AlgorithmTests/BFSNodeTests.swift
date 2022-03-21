//
//  BFSNodeTests.swift
//  AlgorithmTests
//
//  Created by Zhang Xiangxiong on 2022/3/21.
//

import XCTest

@testable import Algorithm

class BFSNodeTests: XCTestCase {

    func test_bfs() {
        let headNode = makeSUT()
        
        BFSNode.breadthFirstSearch(first: headNode)
    }

    func makeSUT() -> BFSNode<String> {
        let nodeA = BFSNode(value: "A", neighbors: [], hasBeenVisited: false)
        let nodeB = BFSNode(value: "B", neighbors: [], hasBeenVisited: false)
        let nodeC = BFSNode(value: "C", neighbors: [], hasBeenVisited: false)
        let nodeD = BFSNode(value: "D", neighbors: [], hasBeenVisited: false)
        let nodeE = BFSNode(value: "E", neighbors: [], hasBeenVisited: false)
        let nodeF = BFSNode(value: "F", neighbors: [], hasBeenVisited: false)
        
        nodeA.addNeighbor(node: nodeB)
        nodeC.addNeighbor(node: nodeB)
        nodeD.addNeighbor(node: nodeB)
        nodeE.addNeighbor(node: nodeB)
        nodeF.addNeighbor(node: nodeD)
        
        return nodeA
    }
}
