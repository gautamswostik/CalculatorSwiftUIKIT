//
//  ViewController.swift
//  CalculatorUIKIT
//
//  Created by swostik gautam on 06/06/2023.
//

import UIKit

class ViewController: UIViewController {
    private func numberAndOperatorButton(title:String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.backgroundColor = .purple
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = Int(title) ?? -1
        button.addTarget(self, action: #selector(onNumberbuttonPressed), for: .touchUpInside)
        return button
    }
    
    private func numberEqualOperationButton() -> UIButton {
        let button = UIButton()
        button.setTitle("=", for: .normal)
        button.backgroundColor = .purple
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(equalOperatorPressed), for: .touchUpInside)
        return button
    }
    
    private func operatorButton(opr:String) -> UIButton {
        let button = UIButton()
        button.setTitle(opr, for: .normal)
        button.backgroundColor = .purple
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(operatorButtonPressed), for: .touchUpInside)
        return button
    }
    
    lazy var textField:UILabel =  {
        let textView = UILabel()
        textView.textAlignment = .right
        textView.numberOfLines = 0
        textView.font = .systemFont(ofSize: 32 , weight: .bold)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let buttonOne = numberAndOperatorButton(title: "1")
        
        let buttonTwo = numberAndOperatorButton(title: "2")
        
        let buttonThree = numberAndOperatorButton(title: "3")
        
        let buttonFour = numberAndOperatorButton(title: "4")
        
        let buttonFive = numberAndOperatorButton(title: "5")
        
        let buttonSix = numberAndOperatorButton(title: "6")
        
        let buttonSeven = numberAndOperatorButton(title: "7")
        
        let buttonEight = numberAndOperatorButton(title: "8")
        
        let buttonNine = numberAndOperatorButton(title: "9")
        
        let buttonZeroZero = numberAndOperatorButton(title: "00")
        
        let buttonZero = numberAndOperatorButton(title: "0")
        
        let buttonDot = numberAndOperatorButton(title: ".")
        
        let plusOperator = operatorButton(opr:"+")
        
        let minusOperator = operatorButton(opr:"-")
        
        let divideOperator = operatorButton(opr:"÷")
        
        let multiplyOperator = operatorButton(opr:"x")
        
        let buttonClear = operatorButton(opr:"C")
        
        let buttonClearOneItem = operatorButton(opr:"<-")
        
        let equalOperation = numberEqualOperationButton()
        
        view.addSubview(textField)
        view.addSubview(buttonOne)
        view.addSubview(buttonTwo)
        view.addSubview(buttonThree)
        view.addSubview(buttonFour)
        view.addSubview(buttonFive)
        view.addSubview(buttonSix)
        view.addSubview(buttonSeven)
        view.addSubview(buttonEight)
        view.addSubview(buttonNine)
        view.addSubview(buttonZeroZero)
        view.addSubview(buttonZero)
        view.addSubview(buttonDot)
        view.addSubview(plusOperator)
        view.addSubview(minusOperator)
        view.addSubview(divideOperator)
        view.addSubview(multiplyOperator)
        view.addSubview(buttonClear)
        view.addSubview(buttonClearOneItem)
        view.addSubview(equalOperation)
        
        
        
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant:  16),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -16),
            textField.bottomAnchor.constraint(equalTo: buttonClearOneItem.topAnchor , constant: -100),
            
            
            buttonClear.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor , constant: 16),
            buttonClear.bottomAnchor.constraint(equalTo: buttonOne.topAnchor , constant:  -10),
            buttonClear.heightAnchor.constraint(equalToConstant: 64),
            buttonClear.widthAnchor.constraint(equalToConstant: 88),
            
            divideOperator.leadingAnchor.constraint(equalTo: buttonClear.trailingAnchor , constant: 10),
            divideOperator.bottomAnchor.constraint(equalTo: buttonTwo.topAnchor , constant:  -10),
            divideOperator.heightAnchor.constraint(equalToConstant: 64),
            divideOperator.widthAnchor.constraint(equalToConstant: 88),
            
            multiplyOperator.leadingAnchor.constraint(equalTo: divideOperator.trailingAnchor , constant: 10),
            multiplyOperator.bottomAnchor.constraint(equalTo: buttonThree.topAnchor , constant:  -10),
            multiplyOperator.heightAnchor.constraint(equalToConstant: 64),
            multiplyOperator.widthAnchor.constraint(equalToConstant: 88),
            
            buttonClearOneItem.leadingAnchor.constraint(equalTo: multiplyOperator.trailingAnchor , constant: 10),
            buttonClearOneItem.trailingAnchor.constraint(equalTo: view.trailingAnchor ,constant: -16),
            buttonClearOneItem.bottomAnchor.constraint(equalTo: minusOperator.topAnchor , constant:  -10),
            buttonClearOneItem.heightAnchor.constraint(equalToConstant: 64),
            buttonClearOneItem.widthAnchor.constraint(equalToConstant: 88),
            
            buttonOne.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor , constant: 16),
            buttonOne.topAnchor.constraint(equalTo: buttonClear.bottomAnchor , constant: -10),
            buttonOne.bottomAnchor.constraint(equalTo: buttonFour.topAnchor , constant:  -10),
            buttonOne.heightAnchor.constraint(equalToConstant: 64),
            buttonOne.widthAnchor.constraint(equalToConstant: 88),
            
            buttonTwo.leadingAnchor.constraint(equalTo: buttonOne.trailingAnchor , constant: 10),
            buttonTwo.bottomAnchor.constraint(equalTo: buttonFive.topAnchor , constant:  -10),
            buttonTwo.heightAnchor.constraint(equalToConstant: 64),
            buttonTwo.widthAnchor.constraint(equalToConstant: 88),
            
            buttonThree.leadingAnchor.constraint(equalTo: buttonTwo.trailingAnchor , constant: 10),
            buttonThree.bottomAnchor.constraint(equalTo: buttonSix.topAnchor , constant:  -10),
            buttonThree.heightAnchor.constraint(equalToConstant: 64),
            buttonThree.widthAnchor.constraint(equalToConstant: 88),
            
            minusOperator.leadingAnchor.constraint(equalTo: buttonThree.trailingAnchor , constant: 10),
            minusOperator.trailingAnchor.constraint(equalTo: view.trailingAnchor ,constant: -16),
            minusOperator.bottomAnchor.constraint(equalTo: plusOperator.topAnchor , constant:  -10),
            minusOperator.heightAnchor.constraint(equalToConstant: 64),
            minusOperator.widthAnchor.constraint(equalToConstant: 88),
            
            buttonFour.bottomAnchor.constraint(equalTo: buttonSeven.topAnchor , constant: -10),
            buttonFour.topAnchor.constraint(equalTo: buttonOne.bottomAnchor , constant: 10),
            buttonFour.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 16),
            buttonFour.heightAnchor.constraint(equalToConstant: 64),
            buttonFour.widthAnchor.constraint(equalToConstant: 88),
            
            buttonFive.bottomAnchor.constraint(equalTo: buttonEight.topAnchor , constant: -10),
            buttonFive.leadingAnchor.constraint(equalTo: buttonFour.trailingAnchor , constant: 10),
            buttonFive.heightAnchor.constraint(equalToConstant: 64),
            buttonFive.widthAnchor.constraint(equalToConstant: 88),
            
            buttonSix.bottomAnchor.constraint(equalTo: buttonNine.topAnchor , constant: -10),
            buttonSix.leadingAnchor.constraint(equalTo: buttonFive.trailingAnchor , constant: 10),
            buttonSix.heightAnchor.constraint(equalToConstant: 64),
            buttonSix.widthAnchor.constraint(equalToConstant: 88),
            
            buttonSeven.bottomAnchor.constraint(equalTo: buttonZeroZero.topAnchor , constant: -10),
            buttonSeven.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 16),
            buttonSeven.heightAnchor.constraint(equalToConstant: 64),
            buttonSeven.widthAnchor.constraint(equalToConstant: 88),
            
            buttonEight.leadingAnchor.constraint(equalTo: buttonSeven.trailingAnchor , constant: 10),
            buttonEight.bottomAnchor.constraint(equalTo: buttonZero.topAnchor , constant: -10),
            buttonEight.heightAnchor.constraint(equalToConstant: 64),
            buttonEight.widthAnchor.constraint(equalToConstant: 88),
            
            buttonNine.bottomAnchor.constraint(equalTo: buttonDot.topAnchor , constant: -10),
            buttonNine.leadingAnchor.constraint(equalTo: buttonEight.trailingAnchor , constant: 10),
            buttonNine.heightAnchor.constraint(equalToConstant: 64),
            buttonNine.widthAnchor.constraint(equalToConstant: 88),
            
            plusOperator.leadingAnchor.constraint(equalTo: buttonSix.trailingAnchor , constant: 10),
            plusOperator.trailingAnchor.constraint(equalTo: view.trailingAnchor ,constant: -16),
            plusOperator.bottomAnchor.constraint(equalTo: equalOperation.topAnchor , constant:  -10),
            plusOperator.heightAnchor.constraint(equalToConstant: 64),
            plusOperator.widthAnchor.constraint(equalToConstant: 88),
            
            buttonZeroZero.topAnchor.constraint(equalTo: buttonSeven.bottomAnchor , constant: 10),
            buttonZeroZero.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttonZeroZero.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 16),
            buttonZeroZero.heightAnchor.constraint(equalToConstant: 64),
            buttonZeroZero.widthAnchor.constraint(equalToConstant: 88),
            
            buttonZero.topAnchor.constraint(equalTo: buttonEight.bottomAnchor , constant: 10),
            buttonZero.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttonZero.leadingAnchor.constraint(equalTo: buttonSeven.trailingAnchor , constant: 10),
            buttonZero.heightAnchor.constraint(equalToConstant: 64),
            buttonZero.widthAnchor.constraint(equalToConstant: 88),
            
            buttonDot.topAnchor.constraint(equalTo: buttonNine.bottomAnchor , constant: 10),
            buttonDot.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttonDot.leadingAnchor.constraint(equalTo: buttonEight.trailingAnchor , constant: 10),
            buttonDot.heightAnchor.constraint(equalToConstant: 64),
            buttonDot.widthAnchor.constraint(equalToConstant: 88),
            
            equalOperation.leadingAnchor.constraint(equalTo: buttonNine.trailingAnchor ,constant: 10),
            equalOperation.trailingAnchor.constraint(equalTo: view.trailingAnchor ,constant: -16),
            equalOperation.topAnchor.constraint(equalTo: buttonNine.topAnchor),
            equalOperation.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            equalOperation.widthAnchor.constraint(equalToConstant: 88),
        ])
        
    }
    
    
    @objc func onNumberbuttonPressed(sender:UIButton) {
        DispatchQueue.main.async {
            if let buttonText = sender.titleLabel?.text {
                self.textField.text = (self.textField.text ?? "") + buttonText
            }
        }
    }
    
    @objc func operatorButtonPressed(sender:UIButton) {
        DispatchQueue.main.async {
            if let buttonText = sender.titleLabel?.text {
                guard (self.textField.text != nil && !self.textField.text!.isEmpty) else {return}
                
                if buttonText == "<-" {
                    self.textField.text?.removeLast()
                    return
                }
                
                if buttonText == "C" {
                    self.textField.text?.removeAll()
                    return
                }
                
                for item in ["+", "x", "-", "÷"] {
                    let stringArray:[String] = Array(self.textField.text!).map{ String($0) }
                    if stringArray.last == item {
                        return
                    }
                }
                
                self.textField.text = (self.textField.text ?? "") + buttonText
            }
        }
    }
    
    
    @objc func equalOperatorPressed() {
        DispatchQueue.main.async {
            if let expression =  self.textField.text {
                self.textField.text = String(Calculator().calculateExpression(expression: expression.replaceWith(from: "x", by: "*").replaceWith(from: "÷", by: "/")))
            }
        }
    }
}

