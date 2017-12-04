//
//  ViewController.swift
//  MyCalc
//
//  Created by Hosomi Fuminao on 2017/11/18.
//  Copyright © 2017年 Hosomi Fuminao. All rights reserved.
//

import UIKit

extension String {
    var expression: NSExpression {
        return NSExpression(format: self)
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var calcField: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func scrollToBottom() {
        calcField.selectedRange = NSRange(location: calcField.text.characters.count, length: 0)
        calcField.isScrollEnabled = true
        let scrollY = calcField.contentSize.height - calcField.bounds.height
        let scrollPoint = CGPoint(x: 0, y: scrollY > 0 ? scrollY : 0)
        calcField.setContentOffset(scrollPoint, animated: false)
    }
    
    func updateText(str: String) {
        calcField.isScrollEnabled = false
        calcField.text = calcField.text + str
        scrollToBottom()
    }
    
    @IBAction func tap0Button(_ sender: Any) {
        updateText(str: "0")
    }
    
    @IBAction func tap1Button(_ sender: Any) {
        updateText(str: "1")
    }
    
    @IBAction func tapPlusButton(_ sender: Any) {
        updateText(str: "+")
    }
    
    @IBAction func tapEqualButton(_ sender: Any) {
        let equations = calcField.text.components(separatedBy: "\n")
        let lastEquation = equations.last!

        guard let result = lastEquation.expression.expressionValue(with: nil, context: nil) as? NSNumber else {
            updateText(str: "\nError!\n")
            return
        }
    }
}

