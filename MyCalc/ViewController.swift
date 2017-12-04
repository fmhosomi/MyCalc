//
//  ViewController.swift
//  MyCalc
//
//  Created by Hosomi Fuminao on 2017/11/18.
//  Copyright © 2017年 Hosomi Fuminao. All rights reserved.
//

import UIKit
import MathParser

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
    
    func addText(_ str: String) {
        calcField.isScrollEnabled = false
        calcField.text = calcField.text + str
        scrollToBottom()
    }
    
    func addTextWithNewLine(_ str: String) {
        addText("\n\(str)\n")
    }
    
    @IBAction func tap0Button(_ sender: Any) {
        addText("0")
    }
    
    @IBAction func tap1Button(_ sender: Any) {
        addText("1")
    }
    
    @IBAction func tapPlusButton(_ sender: Any) {
        addText("+")
    }
    
    @IBAction func tapEqualButton(_ sender: Any) {
        let text: String
        defer {addTextWithNewLine(text)}
        
        let equations = calcField.text.components(separatedBy: "\n")
        let lastEquation: String = equations.last!
        do {
            let value = try lastEquation.evaluate()
            
            // 整数値の表示に .0 がつくのを回避するための処理
            text = value == floor(value) ? "=\(Int(value))" : "=\(value)"
        } catch {
            text = "Invalid Expression!"
            return
        }
        
    }
}

