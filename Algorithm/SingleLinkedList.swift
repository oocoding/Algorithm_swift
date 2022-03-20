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
    
    
    var isEmpty: Bool {
        head == nil
    }
    
    func append(value: T) {
        let newNode = Node(value: value)
        
        guard isEmpty == false else {
            self.head = newNode
            self.tail = newNode
            return
            
        }
        
        self.tail?.next = newNode
        self.tail = newNode
    }
    
}


extension SingleLinkedList: CustomStringConvertible {
    public var description: String {
        if isEmpty {
            return "Empty SingleLinkedList"
        }
        
        return "List:" + String(describing: self.head!)
    }
    
    
}
