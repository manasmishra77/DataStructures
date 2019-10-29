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
        //if let numText = textfield.text {
            //let arr = "12L13R24L25R36L37R"
//            let arr = "12L13R24L25R36L37R59R58L80R"
//
//            let tree = FullBinaryTree(tree: arr)
//            tree.printTheTree()
            
            //print(Problems().isStringSubstringOf(sub: numText, str: "manas"))
            trie()
        //}
        
        
        
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

