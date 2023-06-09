//
//  Calculator.swift
//  CalculatorUIKIT
//
//  Created by swostik gautam on 08/06/2023.
//

import Foundation

class Calculator {

    func calculateExpression(expression: String) -> Double {
        let trimmedExpression = expression.replacingOccurrences(of: " ", with: "")
        var stack = [Double]()
        var operatorStack = [String]()

        let precedence: [String: Int] = [
            "+": 1,
            "-": 1,
            "*": 2,
            "/": 2
        ]

        func performOperation() {
            let operatorToken = operatorStack.removeLast()
            let operand2 = stack.removeLast()
            let operand1 = stack.removeLast()
            var result: Double

            switch operatorToken {
            case "+":
                result = operand1 + operand2
            case "-":
                result = operand1 - operand2
            case "*":
                result = operand1 * operand2
            case "/":
                if operand2 == 0 {
                    fatalError("Cannot divide by zero")
                }
                result = operand1 / operand2
            default:
                fatalError("Invalid operator: \(operatorToken)")
            }

            stack.append(result)
        }

        var i = 0
        while i < trimmedExpression.count {
            let token = trimmedExpression.getCharacterAtIndex(i)

            if isDigit(token) {
                var number = token
                var j = i + 1
                while j < trimmedExpression.count {
                    let nextToken = trimmedExpression.getCharacterAtIndex(j)
                    if isDigit(nextToken) || nextToken == "." {
                        number += nextToken
                        j += 1
                    } else {
                        break
                    }
                }
                if let num = Double(number) {
                    stack.append(num)
                }
                i = j - 1
            } else if let tokenPrecedence = precedence[token] {
                if i == 0 || trimmedExpression.getCharacterAtIndex(i - 1) == "(" {
                    stack.append(0)
                }

                while !operatorStack.isEmpty, let lastOperatorPrecedence = precedence[operatorStack.last!], tokenPrecedence <= lastOperatorPrecedence {
                    performOperation()
                }
                operatorStack.append(token)
            }

            i += 1
        }

        while !operatorStack.isEmpty {
            performOperation()
        }

        if stack.count == 1 {
            return stack.last ?? 0.0
        } else {
            fatalError("Invalid expression")
        }
    }

    func isDigit(_ token: String) -> Bool {
        return Double(token) != nil || token == "."
    }
}
