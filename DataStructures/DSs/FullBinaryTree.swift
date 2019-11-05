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
    init() {
        
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
       // printTheTreeInOrderUsingLoopOnly(root: root)
        //printTheTreePreOrderUsingLoopOnly(root: root)
        //printTheTreeInOrder(root: root)
        //printTheTreePreOrder(root: root)
        //printTheTreePostOrder(root: root)
       // breadthFirstTraversalUsingQueue(root: root)
        //zigZagTreeTraversal(root: root)
        printTreeAsPyramid(root).printMatrix()
        print(isFullBinaryTree(root: root))
    }
    
    func printTheTreePreOrder(root: TreeNode) {
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
    
    func printTheTreeInOrder(root: TreeNode) {
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
    func printTheTreePreOrderUsingStack(root: TreeNode) {
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
    func printTheTreeInOrderUsingStack(root: TreeNode) {
        
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
                    if newTemp == nil || stack.isEmpty {
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
//Print using while loop

extension FullBinaryTree {
    func printTheTreeInOrderUsingLoopOnly(root: TreeNode) {
        var current: TreeNode? = root
        while current != nil {
            if !(current!.hasLeftChild) {
                print(current!.data ?? 0)
               current = current?.right
            } else {
                var pred = current!.left
                while !(pred?.right == nil || pred?.right === current) {
                    pred = pred?.right
                }
                if pred?.right == nil {
                    pred?.right = current
                    current = current?.left
                } else {
                    pred?.right = nil
                    print(current!.data ?? 0)
                    current = current?.right
                }
                
            }
        }
    }
    func printTheTreePreOrderUsingLoopOnly(root: TreeNode) {
        var current: TreeNode? = root
        while current != nil {
            if !(current!.hasLeftChild) {
                print(current!.data ?? 0)
               current = current?.right
            } else {
                var pred = current!.left
                while !(pred?.right == nil || pred?.right === current) {
                    pred = pred?.right
                }
                if pred?.right == nil {
                    print(current!.data ?? 0)
                    pred?.right = current
                    current = current?.left
                } else {
                    pred?.right = nil
                    current = current?.right
                }
                
            }
        }
    }
    func printTheTreePostOrderUsingLoopOnly(root: TreeNode) {
        var current: TreeNode? = root
        while current != nil {
            if !(current!.hasLeftChild) {
                print(current!.data ?? 0)
               current = current?.right
            } else {
                var pred = current!.left
                while !(pred?.right == nil || pred?.right === current) {
                    pred = pred?.right
                }
                if pred?.right == nil {
                    print(current!.data ?? 0)
                    pred?.right = current
                    current = current?.left
                } else {
                    pred?.right = nil
                    current = current?.right
                }
                
            }
        }
    }
}

//Breadth First Traversal
extension FullBinaryTree {
    func breadthFirstTraversalUsingQueue(root: TreeNode) {
        let queue = Queue<TreeNode>(size: 100)
        _ = queue.enqueue(root)
        while !queue.isEmpty {
            let node = queue.dequeue()
            print(node!.data ?? 0)
            if node!.hasLeftChild {
                _ = queue.enqueue(node!.left!)
            }
            if node!.hasRightChild {
                _ = queue.enqueue(node!.right!)
            }
        }
    }
    
    func zigZagTreeTraversal(root: TreeNode) {
        var isOdd = false
        let level = TreeNode(-100)
        let queue = Queue<TreeNode>(size: 100)
        let stack = Stack<TreeNode>(size: 100)
        _ = queue.enqueue(root)
        _ = queue.enqueue(level)
        while !queue.isEmpty {
            let node = queue.dequeue()
            if node === level {
                if isOdd {
                    while !stack.isEmpty {
                        print(stack.pop()?.data ?? 0)
                    }
                }
                isOdd = !isOdd
                if !queue.isEmpty {
                    _ = queue.enqueue(node!)
                }
            } else {
                if isOdd {
                    _ = stack.push(node!)
                } else {
                    print(node!.data ?? 0)
                }
                if node!.hasLeftChild {
                    _ = queue.enqueue(node!.left!)
                }
                if node!.hasRightChild {
                    _ = queue.enqueue(node!.right!)
                }
            }
        }
    }
    
    func printTreeAsPyramid(_ root: TreeNode) -> Matrix<String> {
        if root.isLeaf {
            let m = Matrix<String>(r: 1, c: 1)
            _ = m.add(r: 0, c: 0, data: "\(root.data ?? 0)")
            return m
        }
        var leftMatrix = Matrix<String>(r: 0, c: 0)
        if root.hasLeftChild {
            leftMatrix = printTreeAsPyramid(root.left!)
        }
        var rightMatrix = Matrix<String>(r: 0, c: 0)
        if root.hasRightChild {
            rightMatrix = printTreeAsPyramid(root.right!)
        }
        
        let mNU = Matrix<String>(r: 1, c: (leftMatrix.columns + rightMatrix.columns)+1)
        _ = mNU.add(r: 0, c: leftMatrix.columns, data: "\(root.data ?? 0)")
        
        let mNL = Matrix<String>(r: leftMatrix.rows, c: 1)
        
        leftMatrix.concatenate(matrix: mNL, isHorizontally: true)
        leftMatrix.concatenate(matrix: rightMatrix, isHorizontally: true)
        mNU.concatenate(matrix: leftMatrix, isHorizontally: false)
        return mNU
    }
}

class TreeNode {
    var data: Int!
    var left: TreeNode?
    var right: TreeNode?
    init() {
        
    }
    
    init(_ data: Int) {
        self.data = data
    }
    
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

extension FullBinaryTree {
    func isFullBinaryTree(root: TreeNode) -> Bool {
        if root.isLeaf {
            return true
        }
        var isFull = root.hasRightChild&&root.hasLeftChild
        if isFull {
            isFull = isFull && isFullBinaryTree(root: root.right!) && isFullBinaryTree(root: root.left!)
        }
        return isFull
    }
    func isCompleteBinaryTree(root: TreeNode) -> Bool {
        return false
    }
}


