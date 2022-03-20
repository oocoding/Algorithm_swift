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
}
