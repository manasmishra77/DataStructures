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
    
    //Converting //1 2 L 1 3 R 2 4 L 2 5 R representation of tree to tree
    init(tree: String) {
        let treeArr = tree.map { (each) -> String in
            return String(each)
        }
        var i = 0
        while i<treeArr.count {
            if root == nil {
                root = TreeNode()
                root.data = Int(treeArr[i])
                continue
            }
            if i%3 == 2 {
                let parentNode = searchInBinaryTree(Int(treeArr[i-2])!, root: root)
                let childNode = TreeNode()
                childNode.data = Int(treeArr[i-1])!
                if treeArr[i] == "L" {
                    parentNode?.left = childNode
                } else {
                    parentNode?.right = childNode
                }
            }
            i+=1
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
    
    func printTheTree() {
        //printTheTreeInOrder(root: root)
        //printTheTreePreOrder(root: root)
        printTheTreePostOrder(root: root)
    }
    
    func printTheTreeInOrder(root: TreeNode) {
        //Using Recursion
        let pre = (root.data == self.root.data) ? "In" : ""
        print("\(pre)\(String(describing: root.data ?? 0)) ")
        if root.hasLeftChild {
            printTheTreeInOrder(root: root.left!)
        }
        if root.hasRightChild {
            printTheTreeInOrder(root: root.right!)
        }
    }
    func printTheTreePreOrder(root: TreeNode) {
        if root.hasLeftChild {
            printTheTreePreOrder(root: root.left!)
        }
        let pre = (root.data == self.root.data) ? "Pre" : ""
        print("\(pre)\(String(describing: root.data ?? 0)) ")
        if root.hasRightChild {
            printTheTreePreOrder(root: root.right!)
        }
    }
    func printTheTreePostOrder(root: TreeNode) {
        if root.hasLeftChild {
            printTheTreePostOrder(root: root.left!)
        }
        if root.hasRightChild {
            printTheTreePostOrder(root: root.right!)
        }
        let pre = (root.data == self.root.data) ? "Post" : ""
        print("\(pre)\(String(describing: root.data ?? 0)) ")
        
    }
    
}
//Print using stack
extension FullBinaryTree {
    func printTheTreeInOrderUsingStack(root: TreeNode) {
        //Using Stack
        let stack = Stack<TreeNode>(size: 100)
        var temp: TreeNode? = root
        
        while temp != nil {
            print(temp!.data ?? 0)
           
            //If node has leftchild then go to left node
            if temp!.hasLeftChild {
                 _ = stack.push(temp!)
                temp = temp!.left!
            } else {
                if stack.isEmpty {
                    break
                }
                var newTemp = temp
                while !((newTemp?.hasRightChild)!) {
                    newTemp = stack.pop()
                    if newTemp == nil {
                        break
                    }
                }
                temp = newTemp?.right
            }
        }
    }
    func printTheTreePreOrderUsingStack(root: TreeNode) {
        
        //Using Stack
        let stack = Stack<TreeNode>(size: 100)
        var temp: TreeNode? = root
        
        while temp != nil {
            //If node has leftchild then go to left node
            if temp!.hasLeftChild {
                 _ = stack.push(temp!)
                temp = temp!.left!
            } else {
                print(temp!.data ?? 0)
                if stack.isEmpty {
                    break
                }
                var newTemp = temp
                while !((newTemp?.hasRightChild)!) {
                    newTemp = stack.pop()
                    print(newTemp!.data ?? 0)
                    if newTemp == nil {
                        break
                    }
                }
                temp = newTemp?.right
            }
        }
    }
    func printTheTreePostOrderUsingStack(root: TreeNode) {
        //Using Stack
        let stack = Stack<TreeNode>(size: 100)
        var temp: TreeNode? = root
        
        while true {
            while temp != nil {
                if temp!.hasRightChild {
                    _ = stack.push(temp!.right!)
                }
                _ = stack.push(temp!)
                temp = temp?.left
            }
            let pop = stack.pop()
            if stack.peek === pop?.right {
                temp = stack.pop()
                _ = stack.push(pop!)
            } else {
                print(pop?.data ?? 0)
                if stack.isEmpty {
                    break
                }
            }
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


