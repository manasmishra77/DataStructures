//
//  Matrix.swift
//  DataStructures
//
//  Created by Manas Mishra on 28/10/19.
//  Copyright © 2019 manas. All rights reserved.
//

import Foundation

class Matrix<T> {
    private var arr: [[T?]] = []
    
    var rows: Int {
        return arr.count
    }
    var columns: Int {
        return arr.first?.count ?? 0
    }
    func getRow(_ index: Int) -> [T?] {
        return arr[index]
    }
    
    //Initialized matrix with size
    init(r: Int, c: Int) {
        for _ in 0..<r {
            var row: [T?] = []
            for _ in 0..<c {
                row.append(nil)
            }
            arr.append(row)
        }
    }
    
    func add(r: Int, c: Int, data: T) -> Bool {
        guard r <  rows, c < columns else {return false}
        (arr[r])[c] = data
        return true
    }
    
    func concatenate(matrix: Matrix<T>, isHorizontally: Bool) {
        if isHorizontally {
            if matrix.rows > self.rows {
                for _ in 0..<matrix.rows-self.rows {
                    var row: [T?] = []
                    for _ in 0..<columns {
                        row.append(nil)
                    }
                    arr.append(row)
                }
            }
            for i in 0..<rows where i < matrix.rows {
                arr[i] += matrix.getRow(i)
            }
            
            if matrix.rows < self.rows {
                for i in matrix.rows-1..<self.rows {
                    for _ in 0..<matrix.columns {
                        arr[i].append(nil)
                    }
                }
            }
            
        } else {
            //When arrays need to be added verticlly
            if self.columns < matrix.columns {
                for i in 0..<self.rows {
                    for _ in 0..<matrix.columns - self.columns {
                        arr[i].append(nil)
                    }
                }
            }
            for i in 0..<matrix.rows {
                arr.append(matrix.getRow(i))
            }
            if self.columns > matrix.columns {
                for i in self.rows-matrix.rows-1..<self.rows {
                    for _ in 0..<self.columns - matrix.columns {
                        arr[i].append(nil)
                    }
                }
            }

            
        }
    }
    
    func printMatrix() {
        for i in 0..<rows {
            var str = ""
            for j in 0..<arr[i].count {
                if let element = arr[i][j] {
                    str += "\(element)"
                } else {
                    str += " "
                }
            }
            print("\(str)\n")
        }
    }
    
    
    
}

