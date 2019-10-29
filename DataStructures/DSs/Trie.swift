//
//  Trie.swift
//  DataStructures
//
//  Created by Manas Mishra on 29/10/19.
//  Copyright © 2019 manas. All rights reserved.
//

import Foundation

class TrieNode {
    var charcaterMap: [Character: TrieNode] = [:]
    var isEndOfWord: Bool!
    
    init(isEnd: Bool) {
        isEndOfWord = isEnd
    }
    var isNodeEmpty: Bool {
        return charcaterMap.count == 0
    }
    func insertInMap(char: Character, node: TrieNode?) {
        charcaterMap[char] = node
    }
    func isCharPresentInMap(char: Character) -> Bool {
        return charcaterMap[char] != nil
    }
    func trieMapFor(char: Character) -> TrieNode {
        return charcaterMap[char]!
    }
}

class Trie {
    var root: TrieNode!
    
    init() {
        root = TrieNode(isEnd: false)
    }
    
    func insertWordUsingLoop(word: String) {
        guard !word.isEmpty else {return}
        var trieNode = root
        for each in word where trieNode != nil {
            if trieNode!.isCharPresentInMap(char: each) {
                trieNode = trieNode!.trieMapFor(char: each)
                let isEnd = each == word.last
                if isEnd {
                    trieNode?.isEndOfWord = isEnd
                }
            } else {
                let isEnd = each == word.last
                let newTrieNode = TrieNode(isEnd: isEnd)
                trieNode!.insertInMap(char: each, node: newTrieNode)
                trieNode = newTrieNode
            }
        }
    }
    func isnertWordUsingRecursion(word: String) {
        guard !word.isEmpty else {return}
        var currentIndex: Int = 0
        func insertChar(node: TrieNode) {
            if currentIndex == word.count {
                node.isEndOfWord = true
                return
            }
            guard currentIndex < word.count else {return}
            if !node.isCharPresentInMap(char: word[currentIndex]) {
                let newTrieNode = TrieNode(isEnd: false)
                node.insertInMap(char: word[currentIndex], node: newTrieNode)
            }
            currentIndex += 1
            insertChar(node: node.trieMapFor(char: word[currentIndex-1]))
        }
        insertChar(node: root)
    }
    
    
    func searchWord(word: String) -> Bool {
        guard !word.isEmpty else {return false}
        var trieNode = root
        for each in word where trieNode != nil {
            if trieNode!.isCharPresentInMap(char: each) {
                trieNode = trieNode?.trieMapFor(char: each)
            } else {
                return false
            }
        }
        return trieNode?.isEndOfWord == true
    }
    
    func deleteWord(word: String) {
        guard !word.isEmpty else {return}
        var trieNode = root
        var currentIndex = 0
        
        func deleteTheWord(node: TrieNode) -> Bool {
            if currentIndex == word.count {
                if node.isEndOfWord {
                    if node.isNodeEmpty {
                        return true
                    } else {
                        node.isEndOfWord = false
                    }
                }
                return false
            }
            if node.isCharPresentInMap(char: word[currentIndex]) {
                currentIndex += 1
                let isToDeleteTheNode = deleteTheWord(node: node.trieMapFor(char: word[currentIndex-1]))
                if isToDeleteTheNode {
                    currentIndex -= 1
                    node.insertInMap(char: word[currentIndex], node: nil)
                    if !node.isEndOfWord && node.isNodeEmpty {
                        return true
                    }
                }
            }
            return false
        }
        _ = deleteTheWord(node: root)
        
    }
    
}
