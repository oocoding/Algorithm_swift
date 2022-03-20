//
//  Node.swift
//  Algorithm
//
//  Created by Zhang Xiangxiong on 2022/3/20.
//

import Foundation

public class Node<T:Equatable> {
    public let value: T
    
    internal var next: Node?
    
    init(value: T) {
        self.value = value
    }
    
}


extension Node: Equatable {
    public static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        lhs.value == rhs.value
    }
    
}
