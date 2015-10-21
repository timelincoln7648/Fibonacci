//
//  FibonacciGenerator.swift
//  Fibonacci
//
//  Created by Kody O'Connell on 9/22/15.
//  Copyright © 2015 Kody O'Connell. All rights reserved.
//

import Foundation
import UIKit

class Fibonacci : SequenceType {
    typealias GeneratorType = FibonacciGenerator
    
    func generate() -> FibonacciGenerator {
        return FibonacciGenerator()
    }
}

class FibonacciGenerator : GeneratorType {
    var current = 0, nextValue = 1
    
    typealias Element = Int
    
    func next() -> Int? {
        let ret = current
        current = nextValue
        nextValue = nextValue &+ ret
            //overflow has occured, set to zero to signal sequence user 
        if nextValue < current {
            //print("limit reached")
            current = 0
        }
        return ret
    }
}
