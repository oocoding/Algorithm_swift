//
//  RBNode.swift
//  Algorithm
//
//  Created by Zhang Xiangxiong on 2022/3/21.
//

import Foundation

// Red Black Node 未完成

public class RBNode<T:Comparable> {

    var color: RBNodeColor = .black
    
    var key: T?
    var leftChild: RBNode?
    var rightChild: RBNode?
    
    weak var parent: RBNode?
    
    public init(key: T?, leftChild: RBNode?, rightChild: RBNode, parent: RBNode) {
        self.key = key
        self.leftChild = leftChild
        self.rightChild = rightChild
        self.parent = parent
        
        leftChild?.parent = self
        rightChild.parent = self
    }
    

    
//    public convenience init(key: T?) {
//        self.init(key: key, leftChild: RBNode(), rightChild: RBNode(), parent: RBNode())
//    }
//
//    public convenience init() {
//        self.init(key: nil, leftChild: nil, rightChild: nil, parent: nil)
//        self.color = .black
//    }
    
}


extension RBNode: Equatable {
    public static func == (lhs: RBNode<T>, rhs: RBNode<T>) -> Bool {
        return lhs.key == rhs.key
    }
}

enum RBNodeColor {
    case red
    case black
}
