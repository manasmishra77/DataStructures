//
//  ViewController.swift
//  DataStructures
//
//  Created by Manas Mishra on 19/10/19.
//  Copyright © 2019 manas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnClicked(_ sender: UIButton) {
        let rep = Problems().calculateNoOfTimesOf(digit: 5, inBetween: 0, and: 56)
        print(rep)
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

