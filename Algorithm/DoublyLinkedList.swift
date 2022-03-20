//
//  DoublyLinkedList.swift
//  Algorithm
//
//  Created by Zhang Xiangxiong on 2022/3/21.
//

import Foundation

public class DoublyLinkedList<T: Equatable> {
    
    var head: DoubleLinkedNode<T>?
    var tail: DoubleLinkedNode<T>?
    
    var isEmpty: Bool {
        head == nil && tail == nil
    }
    
    
    
    // TODO: wait to fix it.
    
    /// - Parameter index: index description
    /// - Returns: description
    public func nodeAt(index: Int) -> DoubleLinkedNode<T>? {
        return nil
    }
    
    
}


extension DoublyLinkedList: Equatable {
    public static func == (lhs: DoublyLinkedList<T>, rhs: DoublyLinkedList<T>) -> Bool {
        
        guard lhs.head == rhs.head && lhs.tail == rhs.tail else {
            return false
        }
        
        return true
    }
    
    
}
