//
//  BinarySearchTree.swift
//  DataStructures
//
//  Created by Manas Mishra on 23/10/19.
//  Copyright © 2019 manas. All rights reserved.
//

import Foundation

class BSTNode {
    var data: Int!
    var left: BSTNode?
    var right: BSTNode?
    
    init(_ data: Int, left: BSTNode?, right: BSTNode?) {
        self.data = data
        self.left = left
        self.right = right
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

class BST {
    var root: BSTNode!
    
    init(_ data: Int) {
        root = BSTNode(data, left: nil, right: nil)
    }
    
    //Insert data in the tree
    func insert(_ parentNode: BSTNode, data: Int) {
        if parentNode.data < data {
            //Go right
            if parentNode.right == nil {
                parentNode.right = BSTNode(data, left: nil, right: nil)
            } else {
                insert(parentNode.right!, data: data)
            }
        } else {
            //Go left
            if parentNode.left == nil {
                parentNode.left = BSTNode(data, left: nil, right: nil)
            } else {
                insert(parentNode.left!, data: data)
            }
        }
    }
    
    //Search data in the tree
    func search(_ parentNode: BSTNode, data: Int) -> BSTNode? {
        if parentNode.data == data {
            return parentNode
        } else if parentNode.data > data {
            //Go right
            if parentNode.right == nil {
                return nil
            } else {
                return search(parentNode.right!, data: data)
            }
        } else {
            //Go left
            if parentNode.left == nil {
                return nil
            } else {
                return search(parentNode.left!, data: data)
            }
        }
    }
    
    func delete(parentNode: BSTNode!, currentNode: BSTNode, data: Int) -> Bool {
        //It's condition for root
        if currentNode.data == data {
            let predecesorNode: BSTNode = (parentNode != nil) ? parentNode : root
            if currentNode.hasRightChild {
                let successorNode = currentNode.right
                if isNodeLeftChildOf(predecesorNode, currentNode: currentNode) {
                    predecesorNode.left = successorNode
                } else {
                    predecesorNode.right = successorNode
                }
                let xleft = successorNode?.left
                successorNode?.left = currentNode.left
                var temp = successorNode?.left
                while temp?.right != nil {
                    temp = temp?.right
                }
                temp?.right = xleft
            } else {
                let successorNode = currentNode.left
                if isNodeLeftChildOf(predecesorNode, currentNode: currentNode) {
                    predecesorNode.left = successorNode
                } else {
                    predecesorNode.right = successorNode
                }
            }
            return true
        } else if data < currentNode.data {
            if currentNode.hasLeftChild {
                return delete(parentNode: currentNode, currentNode: currentNode.left!, data: data)
            } else {
                return false
            }
        } else {
            if currentNode.hasRightChild {
                return delete(parentNode: currentNode, currentNode: currentNode.right!, data: data)
            } else {
                return false
            }
        }
    }
    func isNodeLeftChildOf(_ parentNode: BSTNode, currentNode: BSTNode) -> Bool {
        if (parentNode.left?.data)! == currentNode.data {
            return true
        }
        return false
    }
}

