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
    
    public init(value: T) {
        self.value = value
    }
    
}


extension Node: Equatable {
    public static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        lhs.value == rhs.value
    }
    
}

extension Node: CustomStringConvertible {
    public var description: String {
        
        guard let next = next else {
            return "\(value)"
        }
            
        return "\(value) -> \(next)"

    }
    
    
}
