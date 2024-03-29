//
//  ViewController.swift
//  DataStructures
//
//  Created by Manas Mishra on 19/10/19.
//  Copyright © 2019 manas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnClicked(_ sender: UIButton) {
        if let numText = textfield.text, let num = Int(numText) {
            //Problems().nthUglyNum(num)
            Problems().noOfWaysForTiling(for: num)
        }
        //if let numText = textfield.text {
            //let arr = "12L13R24L25R36L37R"
//            let arr = "12L13R24L25R36L37R59R58L80R"
//
//            let tree = FullBinaryTree(tree: arr)
//            tree.printTheTree()
            
            //print(Problems().isStringSubstringOf(sub: numText, str: "manas"))
            //trie()
        //}
//       var a1 = ["ma", "ak", "ks", "jkl"]
//       var a2 = ["manas", "akash", "kddsks", "ksssaas"]
//        print(Problems().returningTheSubstringArray(a1: a1, a2: a2))
        
        //-1, -2, 3, 4, -5

//        let linkedList = LinkedList<Int>(data: -1)
//        linkedList.append(-2)
//        linkedList.append(-3)
//        linkedList.append(4)
//        linkedList.append(5)
//        linkedList.append(-6)
//        linkedList.append(7)
//        linkedList.append(-8)
//        linkedList.append(9)
//        mergeSortUsingLinkedList(list: linkedList)
       // Problems().sortLinkListActucally(linklist: linkedList)
        //linkedList.printList()
        
//        let str = "1ad23s"
//        Problems().numberFromString(str: str)
//        let rec1 = Problems.Rectangle(bottomLeft: CGPoint(x: 1, y: 1), topRight: CGPoint(x: 4, y: 3))
//        let rec2 = Problems.Rectangle(bottomLeft: CGPoint(x: 3, y: 0), topRight: CGPoint(x: 7, y: 3))
//        print(Problems().areaOfOverlappingRectangle(rec1: rec1, rec2: rec2))
        
//        var arr = [3, 4, 7, 5, 6, 8, 1, 9, 2]
//        arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
//        arr = [4, 3, 2, 1]
//        //mergeSortOnArray(arr: &arr)
//        quickSortOnArray(arr: &arr)
        
//        let pre = [1, 2, 4, 6, 5, 3]
//        let p = ["N", "N", "N", "L", "L", "L"]
//        Problems().convertingPreToInOrderWithoutStack(pre: pre, p: p)
        //Problems().fibbonacciNumbers(till: 15)
        
        //Problems().findMaximumCoin(a: [5, 7, 14, 3, 6, 5, 7, 14, 3, 6])
       // let arr = [8, 5, 9, 10, 5, 6, 21, 8]
//        let arr = [2, 5, 3, 9, 15, 33, 6, 18, 20]
//        Problems().getMaximumSum(kTh: 4, arr: arr)
        
        //var arr = [5, -6, 4, 8, 7, -3, 9, 5, 6]
        //arr = [-2, -3, 4, -1, -2, 1, 5, -3]
        
        //Problems().getLargestSumOfSubArray(arr: arr)
        
//        var arr = [[1, 3, 3], [2, 1, 4], [0, 6, 4]]
//        arr = [[10, 33, 13, 15], [22, 21, 04, 1], [5, 0, 2, 3], [0, 6, 14, 2]]
//        Problems().maximumGoldCoin(for: arr)
        
        Problems().findTheMaximumCoinPossibleFromThegivenCondition(prices: [60, 100, 120], weight: [10, 20, 30], maxW: 50)
        //Problems().findTheMaximumCoinPossibleFromThegivenCondition(prices: [6, 10, 12], weight: [1, 2, 3], maxW: 5)
        
        
        
    }
    
    func trie() {
        let arr = ["man", "mat", "cat", "manas", "manav", "machine", "can"]
        let trie = Trie()
        trie.insertWordUsingLoop(word: arr[0])
        trie.insertWordUsingLoop(word: arr[1])
        trie.isnertWordUsingRecursion(word: arr[2])
        trie.isnertWordUsingRecursion(word: arr[3])
        print(trie.searchWord(word: arr[2]))
        print(trie.searchWord(word: arr[5]))
        print(trie.searchWord(word: "ma"))
        trie.insertWordUsingLoop(word: arr[4])
        trie.insertWordUsingLoop(word: arr[5])
        trie.insertWordUsingLoop(word: arr[6])
        print(trie.searchWord(word: arr[4]))
        trie.deleteWord(word: arr[4])
        print(trie.searchWord(word: arr[4]))
        print(trie.lexicofraphicallyReturneTheArray())
    }
    
    
    func heap() {
        var items = [5, 7, 14, 3, 6, 8, 12, 16]
        var heap = Heap(&items, isMin: true)
        heap.heapSortTheArray(items: &items)
    }
    
    func bst() {
        let bst = BST(12)
        bst.insert(bst.root, data: 8)
        bst.insert(bst.root, data: 16)
        bst.insert(bst.root, data: 15)
        bst.insert(bst.root, data: 17)
        bst.insert(bst.root, data: 6)
        bst.insert(bst.root, data: 10)
        bst.insert(bst.root, data: 11)
        bst.insert(bst.root, data: 7)
        bst.insert(bst.root, data: 5)
        bst.insert(bst.root, data: 9)
        
        bst.delete(parentNode: nil, currentNode: bst.root, data: 8)

    }
    
}

