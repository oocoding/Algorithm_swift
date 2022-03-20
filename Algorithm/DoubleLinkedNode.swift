//
//  DoubleLinkedNode.swift
//  Algorithm
//
//  Created by Zhang Xiangxiong on 2022/3/21.
//

import Foundation

public class DoubleLinkedNode<T:Equatable> {
    
    public let value: T
    
    var next: DoubleLinkedNode?
    
    weak var previous: DoubleLinkedNode?
    
    init(value: T) {
        self.value = value
    }
}


extension DoubleLinkedNode: Equatable {
    public static func == (lhs: DoubleLinkedNode<T>, rhs: DoubleLinkedNode<T>) -> Bool {
        lhs.value == rhs.value
    }
    
    
}
