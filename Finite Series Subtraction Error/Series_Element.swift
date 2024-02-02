//
//  Series_Element.swift
//  Finite Series Subtraction Error
//
//  Created by Phys440Zachary on 2/2/24.
//

import SwiftUI
import Observation

@Observable class seriesElement {
    func series1Element(N: Int) async -> Float{
        let result: Float = Float(pow(-1.0, N))*N/(N+1)
        
        return result
    }
    
    func series2ElementNegative(N: Int) async -> Float{
        let result: Float = Float(2*N - 1)/(2*N)
        
        return result
    }
    
    func series2ElementPositive(N: Int) async -> Float{
        let result: Float = Float(2*N)/(2*N + 1)
        
        return result
    }
    
    func series3Element(N: Int) async -> Float{
        let result: Float = 1/Float(2*N*(2*N + 1))
    }
}
