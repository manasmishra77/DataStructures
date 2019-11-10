//
//  DynamicProgramming.swift
//  DataStructures
//
//  Created by Manas Mishra on 07/11/19.
//  Copyright © 2019 manas. All rights reserved.
//

import Foundation

extension Problems {
    func fibbonacciNumbers(till num: Int) -> Int {
        var fibonacciSeries: [Int?] = []
        for i in 0..<num {
            fibonacciSeries.append(nil)
        }
        var i = 0
        func getFibonacciSeries(_ n: Int) -> Int {
            if fibonacciSeries[n - 1] != nil {
                return fibonacciSeries[n - 1]!
            }
            if n - 1 == 0 {
                fibonacciSeries[n - 1] = 0
                return 0
            } else if n - 1 == 1 {
                fibonacciSeries[n - 1] = 1
                return 1
            }
            let sum = getFibonacciSeries(n-1) + getFibonacciSeries(n-2)
            fibonacciSeries[n - 1] = sum
            return sum
        }
        getFibonacciSeries(num)
        let s = fibonacciSeries.map { (a) -> Int in
            return a!
        }
        print(s)
        return fibonacciSeries[num-1]!
    }
    
}
