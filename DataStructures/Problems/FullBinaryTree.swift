//
//  FullBinaryTree.swift
//  DataStructures
//
//  Created by Manas Mishra on 26/10/19.
//  Copyright © 2019 manas. All rights reserved.
//

import Foundation

//1 2 L 1 3 R 2 4 L 2 5 R
class FullBinaryTree {
    var root: TreeNode!
    
    init(tree: String) {
        var treeArr = tree.map { (each) -> String in
            return String(each)
        }
        var i = 0
        while i<treeArr.count {
            if root == nil {
                root = TreeNode()
                root.data = Int(treeArr[i])
                continue
            }
            let parentNode = searchInBinaryTree(Int(treeArr[i])!, root: root)
            
        }
        
    }
    func searchInBinaryTree(_ data: Int, root: TreeNode) -> TreeNode? {
        if root.data == data {
            return root
        } else {
            if root.hasLeftChild, let leftNode = searchInBinaryTree(data, root: root.left!) {
                return leftNode
            }
            if root.hasRightChild, let rightNode = searchInBinaryTree(data, root: root.right!) {
                return rightNode
            }
            return nil
        }
    }
}

class TreeNode {
    var data: Int!
    var left: TreeNode?
    var right: TreeNode?
    var hasLeftChild: Bool {
        return left != nil
    }
    var hasRightChild: Bool {
        return right != nil
    }
    var isLeaf: Bool {
        return (left == nil && right == nil)
    }
}


