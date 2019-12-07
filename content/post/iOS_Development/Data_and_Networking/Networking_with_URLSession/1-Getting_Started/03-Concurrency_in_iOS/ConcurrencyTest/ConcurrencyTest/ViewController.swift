//
//  ViewController.swift
//  ConcurrencyTest
//
//  Created by Devin X D LI on 2019/12/4.
//  Copyright © 2019 Devin X D LI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var primeNumberButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculatePrimeNumbers(_ sender: UIButton) {
        let queue = OperationQueue()
//        let operation = CalculatePrimeOperation()
//        queue.addOperation(operation)
        queue.addOperation {
            for number in 0...100_000_000 {
                let isPrimeNumber = self.isPrime(number: number)
                print("\(number) is prime: \(isPrimeNumber)")
            }
        }
    }
    
    func isPrime(number: Int) -> Bool {
        if number < 1 {
            return false
        }
        if number < 3 {
            return true
        }
        
        var i = 2
        while i * i <= number  {
            if number % 2 == 0 {
                return false
            }
            i = i + 2
        }
        return true
    }
}

