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
    
    
    
    /// <#Description#>
    /// - Parameters:
    ///   - index: 插入的小标
    ///   - value: 元素的值
    /// - Returns: 是否成功
    /// 只有插入的Element 能存在 list 的index 的位置上时，插入成功，否则插入失败
    public func insert(at index:Int, value: T) -> Bool {
   
        let newNode = Node(value: value)
        
        
        if index < 0 {
            return false
        }

        if isEmpty==true && index > 0 {
            return false
        }
        
        // 下标是 0 必须成功
        if index == 0 {
            newNode.next = head
            head = newNode
            
            if tail == nil { tail = newNode }
            
            return true
        }
        
        
        var prev = self.head
        var curr = self.head
        
        for _ in 0 ..< index {
            prev = curr
            curr = curr?.next
        }

        
        if prev == nil && curr == nil {
            print(">> index is out of bounds. index:\(index)")
            print(">>list: \(head!)")
            return false
        }
        
        else if prev != nil && curr == nil {
            prev?.next = newNode
            tail = newNode
            return true
        }
        
        else if prev != nil && curr != nil {
            newNode.next = prev?.next
            prev?.next = newNode
            return true
        }
        
        
        return false
    }
    
}


extension SingleLinkedList: Equatable {
    public static func == (lhs: SingleLinkedList<T>, rhs: SingleLinkedList<T>) -> Bool {
        
        guard lhs.head == rhs.head, lhs.tail == rhs.tail else {
            return false
        }

        var lhsCurr = lhs.head
        var rhsCurr = rhs.head
        
        while lhsCurr == rhsCurr, lhsCurr != nil {
            lhsCurr = lhsCurr?.next
            rhsCurr = rhsCurr?.next
        }
        
        if lhsCurr==nil, rhsCurr==nil {
            return true
        } else {
            return false
        }
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
