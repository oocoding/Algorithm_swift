//
//  QueueByArray.swift
//  Algorithm
//
//  Created by Zhang Xiangxiong on 2022/3/21.
//

import Foundation

// 使用数组实现队列
public class QueueByArray<T> {
    
    let capacity: Int
    
    private var items:[T?]
    
    var enQueueIndex:Int = 0
    var dequeueIndex:Int = 0
    
    var isEmpty: Bool {
        // other ways
        self.items[dequeueIndex] == nil ? true:false
    }
    
    
    
    var isFull: Bool {
        // other ways
        let flatedNilItems = items.compactMap{$0}
        return flatedNilItems.count == capacity ? true : false
    }
    
    init(capacity: Int) {
        self.capacity = capacity
        self.items = Array(repeating: nil, count: capacity)
    }
    
    
    public func enqueue(_ item: T) -> Bool {
        guard items[enQueueIndex] == nil else {
            return false
        }
        
        self.insertItem(item, at: enQueueIndex)
        return true
    }
    
    
    public func dequeue() -> T? {
        guard let item = self.items[dequeueIndex] else {
            return nil
        }
        
        self.items[dequeueIndex] = nil
        dequeueIndex += 1
        dequeueIndex %= capacity
        return item
    }
    
    private func insertItem(_ item: T, at index: Int) {
        
        self.items[index] = item
        enQueueIndex += 1
        enQueueIndex %= capacity
    }
}


extension QueueByArray: CustomStringConvertible {
    public var description: String {
        return "\(self.items)"
    }
}
