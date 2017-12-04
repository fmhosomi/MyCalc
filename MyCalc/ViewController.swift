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

    // MARK: - Util

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

    // MARK: - Actions
    
    @IBAction func tap0Button(_ sender: Any) {
        addText("0")
    }

    @IBAction func tap00Button(_ sender: Any) {
        addText("00")
    }

    @IBAction func tap1Button(_ sender: Any) {
        addText("1")
    }
    
    @IBAction func tap2Button(_ sender: Any) {
        addText("2")
    }
    
    @IBAction func tap3Button(_ sender: Any) {
        addText("3")
    }

    @IBAction func tap4Button(_ sender: Any) {
        addText("4")
    }

    @IBAction func tap5Button(_ sender: Any) {
        addText("5")
    }

    @IBAction func tap6Button(_ sender: Any) {
        addText("6")
    }

    @IBAction func tap7Button(_ sender: Any) {
        addText("7")
    }

    @IBAction func tap8Button(_ sender: Any) {
        addText("8")
    }

    @IBAction func tap9Button(_ sender: Any) {
        addText("9")
    }

    @IBAction func tapDotButton(_ sender: Any) {
        addText(".")
    }

    @IBAction func tapPlusButton(_ sender: Any) {
        addText("+")
    }

    @IBAction func tapMinusButton(_ sender: Any) {
        addText("-")
    }

    @IBAction func tapTimesButton(_ sender: Any) {
        addText("*")
    }

    @IBAction func tapDivideButton(_ sender: Any) {
        addText("/")
    }

    @IBAction func tapPercentButton(_ sender: Any) {
//        addText("")
    }

    @IBAction func tapAllClearButton(_ sender: Any) {
        var equations = calcField.text.components(separatedBy: "\n")
        equations.removeLast()
        calcField.text = equations.joined(separator: "\n") + "\n"
    }

    @IBAction func tapDeleteButton(_ sender: Any) {
        calcField.text.remove(at: calcField.text.index(before: calcField.text.endIndex))
    }

    @IBAction func tapEqualButton(_ sender: Any) {
        let text: String
        defer { addTextWithNewLine(text) }
        
        let equations = calcField.text.components(separatedBy: "\n")
        let lastEquation: String = equations.last!
        do {
            let value = try lastEquation.evaluate()
            
            // 整数値の表示に .0 がつくのを回避するための処理
            // value の絶対値が Int.max より小さい時のみ Int にキャストする 
            text = value == floor(value) && fabs(value) < Double(Int.max) ? "=\(Int(value))" : "=\(value)"
        } catch {
            text = "Invalid Expression!"
            return
        }
        
    }
}

