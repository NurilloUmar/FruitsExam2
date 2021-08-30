//
//  Question.swift
//  FruitsExam2
//
//  Created by apple on 27/07/21.
//

import Foundation
import  UIKit


struct Question {
    
    var firstNum : Int
    var secondNum : Int
    var rightAnswer : Int {
        return firstNum+secondNum
    }
    var variants : [Int]
    init() {
        self.firstNum = [1,2,3,4,5].randomElement()!
        self.secondNum = [1,2,3,4,5].randomElement()!
        
        let rightAnswer = firstNum+secondNum
        
        var news = [Int]()
        var news1 = [Int]()
        var news2 = [Int]()
        
        news.append(rightAnswer)
        
        for i in 1...10{
            if i==rightAnswer{
                continue
            }
            news1.append(i)
        }
        news1.shuffle()
        news1.removeLast(6)
        news2 = news+news1
        news2.shuffle()
        self.variants = news2    }
    var choosenAnswer:Int?
}
