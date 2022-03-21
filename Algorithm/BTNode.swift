//
//  BTNode.swift
//  Algorithm
//
//  Created by Zhang Xiangxiong on 2022/3/21.
//

import Foundation

// binary tree node.
public class BTNode<T: Comparable> {
    
    public var value: T
    
    public var leftChild: BTNode?
    public var rightChild: BTNode?
    
    init(_ value: T, _ leftChild: BTNode?, _ rightChild: BTNode?) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
    
    
    /// 首先访问 leftChild, 然后是中间节点，然后是 rightChild,递归完所有子节点.
    /// 当这个tree 是order的话，那么得到会升序结果。
    /// order 的意思是，所有左节点小于中间节点，中间节点小于他的有节点
    /// - Parameter node: 开始访问的中间节点
    class public func inOrderTraversal(_ node: BTNode?) {
        guard let node = node else {
            return
        }
        
        inOrderTraversal(node.leftChild)
        print(node)
        inOrderTraversal(node.rightChild)
    }
    
    
    /// Pre-order traversal always starts from the current node, then continue to visit the left and right children.
    /// - Parameter node: 开始访问的中间节点
    class public func preOrderTraversal(_ node: BTNode) {

        
        // 访问中间节点
        print(node)
        
        // 访问 left
        if let left = node.leftChild {
            preOrderTraversal(left)
        }
        
        // 访问 right
        if let right = node.rightChild {
            preOrderTraversal(right)
        }
    }
    
    
    /// Post-order traversal first visits the leftmost node, then the right node and then its parent. After that it visits the previous parent with the same rule.
    /// - Parameter node: 中间节点
    class public func postOrderTraversal(_ node: BTNode?) {
        guard let node = node else {
            return
        }
        
        self.postOrderTraversal(node.leftChild)
        self.postOrderTraversal(node.rightChild)
        
        print(node)

    }
    
}


extension BTNode {
    
    // 递归获取最小元素
    var min: BTNode {
        guard let left = self.leftChild else {
            return self
        }
        
        return left.min
    }
}

extension BTNode: CustomStringConvertible {
    public var description: String {
        
        if self.leftChild == nil, self.rightChild == nil {
            return "nil <- \(self.value) -> nil"
        }
        
        else if self.leftChild != nil, self.rightChild == nil {
            return "\(self.leftChild!.value) <- \(self.value) -> nil"
        }
        
        else if self.leftChild == nil, self.rightChild != nil {
            return "nil <- \(self.value) -> \(self.rightChild!.value)"
        }
        
        else if self.leftChild != nil, self.rightChild != nil {
            return "\(self.leftChild!.value) <- \(self.value) -> \(self.rightChild!.value)"
        }
        
        fatalError("Bug..")
    }
    
    
}
