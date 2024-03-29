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

extension Problems {
    //find the maximum possible coin that can be fetched
    func findMaximumCoin(a: [Int]) -> Int {
        
        var memoArr: [[Int?]] = []
        
        for i in 0..<a.count {
             var arr: [Int?] = []
            for j in 0..<a.count {
                arr.append(nil)
            }
            memoArr.append(arr)
        }
        
        func getMaximumPossibleCoin(_ s: Int, _ e: Int) -> Int {
            if let sum = memoArr[s][e] {
                return sum
            }
            if (s+1 == e) || (s == e) {
                let sum = max(a[s], a[e])
                memoArr[s][e] = sum
                return sum
            }
            guard s < e else {return 0}
            
            //if s is to be taken
            //Case1:
            let newSForCase1 = (a[s+1] > a[e]) ? s+2 : s+1
            let newEForCase1 = (a[s+1] > a[e]) ? e : e-1
            let sumForCase1 = a[s] + getMaximumPossibleCoin(newSForCase1, newEForCase1)
            
            //Case2:
            let newSForCase2 = (a[s] > a[e-1]) ? s+1 : s
            let newEForCase2 = (a[s] > a[e-1]) ? e-1 : e-2
            let sumForCase2 = a[e] + getMaximumPossibleCoin(newSForCase2, newEForCase2)
            
            let sum = max(sumForCase1, sumForCase2)
            memoArr[s][e] = sum
            
            return sum
        }
        
        let s = getMaximumPossibleCoin(0, a.count-1)
        print(s)
        return s
    }
}

extension Problems {
    //Given an array sequence [A1, A2 …An], the task is to find the maximum possible sum of increasing subsequence S of length k such that S1<=S2<=S3………<=Sk.
    func getMaximumSum(kTh: Int, arr: [Int]) -> Int {
        var sum = 0
        var sums = [[Int?]]()
        for i in 0..<arr.count {
            var a = [Int?]()
            for j in 0..<kTh {
                a.append(nil)
            }
            sums.append(a)
        }
        
        func replaceWithNewSum(newS: Int) {
            if sum < newS {
                sum = newS
            }
        }
        var j = 0
        
        func getSum(k: Int, s: Int, i: Int, p: Int?) {
            guard (i < arr.count && k > 0) else {
                if k == 0 {
                    replaceWithNewSum(newS: s)
                }
                return
            }
            var iCanBeUsed = true
            if let p = p {
                iCanBeUsed = arr[i] >= arr[p]
            }

            j += 1
            print(j)
            
            if iCanBeUsed {
                getSum(k: k-1, s: s + arr[i], i: i+1, p: i)
            }
            getSum(k: k, s: s, i: i+1, p: p)
        }
        
        getSum(k: kTh, s: sum, i: 0, p: nil)
        
        print(sum)
        return sum
    }
}

extension Problems {
    //Given a number n, the task is to find n’th Ugly number.
    
    func nthUglyNum(_ n: Int) -> Int {
        var uglyNumCount = 1
        var num = 2
        var nums: [Bool] = [true]
        var uglyFactors: [Int] = [2, 3, 5]
        
        func isUgly(_ n: Int) -> Bool {
            var n = n
            var p = 0
            
            while (uglyFactors[p] < n) {
                if nums.count > n-1 {
                    return nums[n-1]
                }
                if (n%uglyFactors[p]) == 0 {
                    n = n/uglyFactors[p]
                } else {
                    if p == uglyFactors.count-1 {
                        return false
                    } else {
                        p += 1
                    }
                }
            }
            return true
        }
 
        while uglyNumCount < n {
            let ugly = isUgly(num)
            nums.append(ugly)
            if ugly {
                uglyNumCount += 1
                if uglyNumCount == n {
                    break
                }
            }
            num += 1
        }
        print(num)
        return num
    }
}


extension Problems {
    //Tiling Problem
    func noOfWaysForTiling(for n: Int) -> Int {
        var ways: [Int] = [0, 1, 2]
        
        func countWays(n: Int) -> Int {
            if n < ways.count {
                return ways[n]
            }
            let way = countWays(n: n-1) + countWays(n: n-2)
            ways.append(way)
            return way
        }
        let way = countWays(n: n)
        print(way)
        return way
    }
}
extension Problems {
    //Gold Mine Problem
    func maximumGoldCoin(for arr: [[Int]]) -> Int {
        let maxC = arr.first?.count ?? 0
        let maxR = arr.count
        var coins: [[Int?]] = []
        for i in 0..<maxR {
            var eachRow = [Int?]()
            for _ in 0..<maxC {
                eachRow.append(nil)
            }
            coins.append(eachRow)
        }
        
        func findMaxCoin(c: Int, r: Int) -> Int {
            //Border case
            if c == maxC || r == maxC || r < 0 {
                return 0
            }
            if coins[r][c] != nil {
                return coins[r][c]!
            }
            //first column case
            if c == 0 {
                var largestCoin = 0
                for i in 0..<maxR {
                    let coin = arr[i][c] + max(findMaxCoin(c: 1, r: i-1), findMaxCoin(c: 1, r: i+1), findMaxCoin(c: 1, r: i))
                    if largestCoin < coin {
                        largestCoin = coin
                    }
                }
                return largestCoin
            }
            //
            let coin = arr[r][c] + max(findMaxCoin(c: c+1, r: r-1), findMaxCoin(c: c+1, r: r+1), findMaxCoin(c: c+1, r: r))
            coins[r][c] = coin
            return coin
        }
        let coin = findMaxCoin(c: 0, r: 0)
        print(coin)
        return coin
    }
}

extension Problems {
    //The 0/1 Knapsack Problem (Demystifying Dynamic Programming)
    
    func findTheMaximumCoinPossibleFromThegivenCondition(prices p: [Int], weight w: [Int], maxW: Int) -> Int {
        let matrix = Matrix<Int>(r: w.count+1, c: maxW+1)
        
        for r in 1...w.count {
            for c in 1...maxW {
                if c < w[r-1] {
                    _ = matrix.add(r: r, c: c, data: matrix.getRow(r-1)[c] ?? 0)
                } else {
                    let data = max(p[r-1]+(matrix.getRow(r-1)[(c-w[r-1])] ?? 0), matrix.getRow(r-1)[c] ?? 0)
                    _ = matrix.add(r: r, c: c, data: data)
                }
            }
        }
        print(matrix.getRow(w.count)[maxW] ?? 0)
        return matrix.getRow(w.count)[maxW] ?? 0
    }
}
