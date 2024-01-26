//
//  Series Calculator.swift
//  Finite Series Subtraction Error
//
//  Created by Phys440Zachary on 1/26/24.
//

import SwiftUI
import Observation

@Observable class FiniteSeries {
    
    var series1Result: Float = 0.0
    var series2Result: Float = 0.0
    var series3Result: Float = 0.0
    
    func computeSeries1(N: Int) -> Float {
        Task{
            let returnedResults = await withTaskGroup(
                of: Float,
                returning: Float,
                body:
            
            )
        }
        
        
        return Float(0.0)
    }
}
