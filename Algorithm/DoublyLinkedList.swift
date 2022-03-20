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
        guard index >= 0 else {
            return nil
        }
        
        guard !isEmpty else {
            return nil
        }
        
        
        var i = index
        
        var node = head
        
        while node != nil {
            if i == 0 { return node }
            i -= 1
            node = node?.next
        }
        
        return nil
    }
    
    
    public func append(newNode: DoubleLinkedNode<T>) {
         guard !isEmpty else {
            head = newNode
            tail = newNode
            return
        }
        
        tail?.next = newNode
        newNode.previous = tail
        tail = newNode
        return
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
