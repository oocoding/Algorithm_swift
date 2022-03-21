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
    
    
    func searchValue(_ value: T) {
        self.searchNode(rootNode: self.root, searchValue: value)
    }
    
    
    private func searchNode(rootNode: BTNode<T>?, searchValue: T) {
        guard let rootNode = rootNode else {
            return
        }
        
        print("root node:", rootNode.value)
        
        if searchValue < rootNode.value {
            
            self.searchNode(rootNode: rootNode.leftChild, searchValue: searchValue)
            
        } else if searchValue > rootNode.value {
            
            self.searchNode(rootNode: rootNode.rightChild, searchValue: searchValue)
            
        } else {
            
            print("Found:\(searchValue)")
            
        }
    }
}
