//
//  main.swift
//  quoteCalculator
//
//  Created by Cayden Glenn Park on 9/30/23.
//

import Foundation


/*
   This is where the whole program runs
*/

func main() {
    print("\nHow many windows do you have that you want cleaned? ")
    if let input = readLine(), let num_of_windows = Int(input)
    {
        print("\nOf those \(num_of_windows) windows, do you want just the interior cleaned, just the exterior cleaned, or both? ")
        print("Please type \"interior\", \"exterior\", or \"both\".")
        if let int_ext = readLine()
        {
            print("\nDo you have a discount code? (yes/no)")
            if let have_discount_code = readLine() 
            {
                
//              This is where the three functions get called to complete the program.
                
                let pricePerWindow = interiorExteriorPrice(num_of_windows: num_of_windows, intExt: int_ext)
                let discountAmount = discount(haveDiscountCode: have_discount_code)
                let finalPrice = calculatePrice(numOfWindows: num_of_windows, pricePerWindow: pricePerWindow, discountAmount: discountAmount)
                print("\nThe final cost to wash your windows will be $\(finalPrice)")
            }
            else {
                print("Invalid input. Please enter \"yes\" or \"no\".")
            }
        }
        else {
            print("Invalid input. Please enter \"interior\", \"exterior\", or \"both\".")
        }
    }
    else {
        print("Invalid input. Please enter a number.")
    }
}


/*
   This function gets the subtotal.
*/

func interiorExteriorPrice(num_of_windows: Int, intExt: String) -> Double {
    let intExtPricing = ["exterior": 3.5, "interior": 3, "both": 7]
    
    if let pricePerWindow = intExtPricing[intExt]
    {
        return pricePerWindow
    }
    else
    {
        print("Invalid input. Please enter \"interior\", \"exterior\", or \"both\".")
        return 0
    }
}


/*
   This function checks to see if the user has a discount.
*/

func discount(haveDiscountCode: String) -> Double {
    let discountCodes = ["Windows-10": 0.10, "Windows-15": 0.15, "Windows-20": 0.20]

    if haveDiscountCode.lowercased() == "yes" 
    {
        print("What is your code? ")
        if let discountCode = readLine(), let discount = discountCodes[discountCode] 
        {
            return discount
        } 
        else
        {
            print("Sorry, that is not a valid code.")
        }
    }
    
    return 0
}


/*
   This function calculates the total including the discount if they have one.
*/

func calculatePrice(numOfWindows: Int, pricePerWindow: Double, discountAmount: Double) -> Double {
    let price = Double(numOfWindows) * pricePerWindow
    let finalPrice = price - (discountAmount * price)
    return finalPrice
}

main()
