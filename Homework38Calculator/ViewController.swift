//
//  ViewController.swift
//  Homework38Calculator
//
//  Created by 黃柏嘉 on 2021/12/9.
//

import UIKit


class ViewController: UIViewController {
    
    //符號Label
    @IBOutlet weak var signLabel: UILabel!
    //數字Label
    @IBOutlet weak var resultLabel: UILabel!
    //紀錄是否是第一個輸入的數字
    var isFirstNumber = true
    //是否是小數
    var isDecimals = false
    //紀錄算式
    var equation = ""
    //取得輸入畫面數字字串
    var inputNumberString:String{
        get{
            return resultLabel.text!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signLabel.text = ""
        view.addGradientlayer(view: self.view)
        
    }
    
    //重新開始
    @IBAction func clean(_ sender: UIButton) {
        isFirstNumber = true
        isDecimals = false
        resultLabel.text = "0"
        signLabel.text = ""
        equation = ""
    }
    
    //後退鍵
    @IBAction func deleteNum(_ sender: UIButton) {
        if  resultLabel.text!.count > 1{
            resultLabel.text?.removeLast()
        }else if resultLabel.text != "0"{
            resultLabel.text = "0"
        }
        if resultLabel.text!.count < 2{
            isDecimals = false
        }
    }
    
    //運算符號
    @IBAction func operation(_ sender: UIButton) {
        //判斷目前數字是整數還是有小數點
        var doubleNum:String
        if checkDecimals(num: Double(inputNumberString)!) == false{
            doubleNum = ".0"
        }else{
            doubleNum = ""
        }
        switch sender.tag{
        case 0:
                equation += inputNumberString+doubleNum+"/"
                signLabel.text = "/"
        case 1:
                equation += inputNumberString+doubleNum+"*"
                signLabel.text = "*"
        case 2:
                equation += inputNumberString+doubleNum+"-"
                signLabel.text = "-"
        case 3:
                equation += inputNumberString+doubleNum+"+"
                signLabel.text = "+"
        default:
                return
        }
        isFirstNumber = true
        isDecimals = false
       
    }
    //等於
    @IBAction func equal(_ sender: UIButton) {
        equation += inputNumberString
        let expression = NSExpression(format: equation)
        if let result = expression.expressionValue(with: nil, context: nil) as? Double {
            if checkDecimals(num: result) == false {
                resultLabel.text = String(result.floor(toInteger: 1))
            } else {
                resultLabel.text = String(result.rounding(toDecimal: 6))
                }
            }
            signLabel.text = "="
            isFirstNumber = true
            isDecimals = false
            equation = ""
    }
    //輸入數字
    @IBAction func inputNumber(_ sender: UIButton) {
        let inputNumber = sender.tag
        if isFirstNumber == true{
            resultLabel.text = String(inputNumber)
            isFirstNumber = false
        }else{
            if resultLabel.text != "0"{
                resultLabel.text! += String(inputNumber)
            }else{
                resultLabel.text = ""
                resultLabel.text = String(inputNumber)
            }
        }
    }
    
    //加入小數點
    @IBAction func addDot(_ sender: UIButton) {
        if isDecimals == false{
            resultLabel.text! += "."
            isDecimals = true
        }
    }
    //轉換正負值
    @IBAction func convertPositiveAndNegative(_ sender: UIButton) {
        if resultLabel.text != ""{
            if let doubleInputNum = Double(inputNumberString){
                if doubleInputNum > 0{
                    //正變負
                    if checkDecimals(num: doubleInputNum) == false{
                        resultLabel.text = "\(-Int(doubleInputNum))"
                    }else{
                        resultLabel.text = "\(-doubleInputNum)"
                    }
                }else{
                   //負變正
                    if checkDecimals(num: doubleInputNum) == false{
                        resultLabel.text = "\(abs(Int(doubleInputNum)))"
                    }else{
                        resultLabel.text = "\(fabs(doubleInputNum))"
                    }
                }
            }
        }
    }
    
    //檢查整數或小數點
    func checkDecimals(num:Double)->Bool{
        if Double(Int(num)) == num{
            return false
        }else{
            return true
        }
    }
}

