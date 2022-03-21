//
//  BFSNode.swift
//  Algorithm
//
//  Created by Zhang Xiangxiong on 2022/3/21.
//

import Foundation

// Breadth-First Search 广度优先搜索

public class BFSNode<T> {
    public var nodeValue: T
    public var nodeNeighbors:[BFSNode] = []
    public var hasBeenVisited: Bool
    
    
    init(value: T, neighbors:[BFSNode]=[], hasBeenVisited:Bool=false) {
        self.nodeValue = value
        self.nodeNeighbors = neighbors
        self.hasBeenVisited = hasBeenVisited
    }
    
    
    public func addNeighbor(node: BFSNode) {
        self.nodeNeighbors.append(node)
        node.nodeNeighbors.append(self)
    }
    
    
    public static func breadthFirstSearch(first: BFSNode) {
        
        var queue: [BFSNode] = []
        queue.append(first)
        
        while !queue.isEmpty {
            guard let node = queue.first  else {
                fatalError()
            }
            
            print(node.nodeValue)
            node.hasBeenVisited = true
            
            for child in node.nodeNeighbors {
                if child.hasBeenVisited == false {
                    queue.append(child)
                }
            }
            
            queue.removeFirst()
        }
    }
}
