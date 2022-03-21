//
//  TreeNode.swift
//  Algorithm
//
//  Created by Zhang Xiangxiong on 2022/3/21.
//

import Foundation

class TreeNode<T: Equatable> {
    let data: T
    
    weak var parent: TreeNode?
    
    var children: [TreeNode] = []
    
    init(data: T) {
        self.data = data
    }
    
    func add(child: TreeNode) {
        self.children.append(child)
        child.parent = self
    }
    
    func search(data: T) -> TreeNode? {
        if self.data == data {
            return self
        }
        
        for child in children {
            if let result = child.search(data: data) {
                return result
            }
        }
        
        return nil
    }
}


extension TreeNode: CustomStringConvertible {
    var description: String {
        return printableMessages().joined(separator: "\n")
    }
    
    
    /// 这里使用 flatMap 展开嵌套数组，很适合递归调用, flatMap 会将嵌套数组变成一维数组
    /// - Returns: 一维数组
    private func printableMessages() -> [String] {
        return ["\(self.data)"] + self.children.flatMap{ $0.printableMessages()}.map{"\t"+$0}
    }
    
    public func printTree() {
        print(self)
    }
    
}
