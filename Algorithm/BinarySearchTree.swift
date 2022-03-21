//
//  BinarySearchTree.swift
//  Algorithm
//
//  Created by Zhang Xiangxiong on 2022/3/21.
//

import Foundation
//    1. If the searched value is less than the current node, it continues to the left subtree.
//    2. If it is greater than the current node, it continues to the right subtree.
class BinarySearchTree<T> where T:Comparable, T:CustomStringConvertible {
    
    private var rootNode: BTNode<T>?
    
    var root: BTNode<T>? {
        self.rootNode
    }
    
    init(rootNode: BTNode<T>?=nil) {
        self.rootNode = rootNode
    }
    
    // 左节点小于中间节点，右节点大于中间节点
    func insert(insertedValue: T) {
        let newNode = BTNode(insertedValue, nil, nil)
        
        guard let rootNode = self.root else {
            self.rootNode = newNode
            return
        }
        
        self.insertNode(rootNode: rootNode, newNode: newNode)
        
    }
    
    
    private func insertNode(rootNode:BTNode<T>, newNode:BTNode<T>) {
        
        if newNode.value < rootNode.value {
            guard let leftNode = rootNode.leftChild else {
                rootNode.leftChild = newNode
                return
            }
            
            self.insertNode(rootNode: leftNode, newNode: newNode)
            
        } else {
            
            guard let rightNode = rootNode.rightChild else {
                rootNode.rightChild = newNode
                return
            }
            
            self.insertNode(rootNode: rightNode, newNode: newNode)
            
        }
    }
    
    
    func searchValue(_ value: T) -> BTNode<T>? {
        return self.searchNode(rootNode: self.root, searchValue: value)
    }
    
    
    private func searchNode(rootNode: BTNode<T>?, searchValue: T) -> BTNode<T>? {
        guard let rootNode = rootNode else {
            return nil
        }
        
        print("root node:", rootNode.value)
        
        if searchValue < rootNode.value {
            
            return self.searchNode(rootNode: rootNode.leftChild, searchValue: searchValue)
            
        } else if searchValue > rootNode.value {
            
            return self.searchNode(rootNode: rootNode.rightChild, searchValue: searchValue)
            
        } else {
            
            return rootNode
            
        }
    }
    
    
    public func removeValue(_ value: T) {
        rootNode = removeNode(rootNode: rootNode, value: value)
    }
    
    
    
    /// 删除节点
    /// - Parameters:
    ///   - rootNode: rootNode description
    ///   - value: value description
    /// - Returns: description
    ///
    /// 1. 该节点是 leaf，没有子节点，那么直接删除即可
    /// 2. 如果该节点只有一个子节点，那么将另外一个子节点重新连接即可
    /// 3. 如果该节点有两个子节点，那么需要找到该节点的右侧的最小节点(a)，那么赋值到待删除的节点上。
    /// 然后再次以该节点作为根节点，删除a的值。 递归思想
    private func removeNode(rootNode: BTNode<T>?, value: T) -> BTNode<T>? {
        guard let rootNode = rootNode else {
            return nil
        }
        
        // find the node
        if value == rootNode.value {
            
            if rootNode.leftChild == nil && rootNode.rightChild == nil {
                // 该节点是 leaf 节点，不需要移动其他节点
                return nil
            }
            
            else if rootNode.leftChild == nil {
                // 只存在左节点，那么只需要移动 右节点
                return rootNode.rightChild
            }
            
            else if rootNode.rightChild == nil {
                return rootNode.leftChild
            }
            
            // 左右子节点都有 node， 找到右侧最小值赋值到当前节点，然后删除右侧最小节点
            rootNode.value = rootNode.rightChild!.min.value
            rootNode.rightChild = removeNode(rootNode: rootNode.rightChild, value: rootNode.value)
        }
        
        else if value < rootNode.value {
            
            rootNode.leftChild = removeNode(rootNode: rootNode.leftChild, value: value)
            
        } else {
            
            rootNode.rightChild = removeNode(rootNode: rootNode.rightChild, value: value)
            
        }
        
        // 只需要执行左侧或右侧节点删除，不需要移动当前层次的节点
        return rootNode
    }
}
