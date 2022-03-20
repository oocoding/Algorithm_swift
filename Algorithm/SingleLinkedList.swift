//
//  SingleLinkedList.swift
//  Algorithm
//
//  Created by Zhang Xiangxiong on 2022/3/20.
//

import Foundation

public class SingleLinkedList<T:Equatable> {
    
    var head: Node<T>?
    var tail: Node<T>?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    
    public func append(value: T) {
        let newNode = Node(value: value)
        
        guard isEmpty == false else {
            head = newNode
            tail = newNode
            return
        }
        
        tail?.next = newNode
        tail = newNode
    }
}


extension SingleLinkedList: Equatable {
    public static func == (lhs: SingleLinkedList<T>, rhs: SingleLinkedList<T>) -> Bool {
        
        guard lhs.head == rhs.head, lhs.tail == rhs.tail else {
            return false
        }

        return true
    }
}



extension SingleLinkedList: CustomStringConvertible {
    public var description: String {
        guard isEmpty == false else {
            return "[Empty LinkedList!]"
        }
        
        return String(describing: head)
    }
    
    
}
