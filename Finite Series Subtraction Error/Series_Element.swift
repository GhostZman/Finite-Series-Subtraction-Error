//
//  Series_Element.swift
//  Finite Series Subtraction Error
//
//  Created by Phys440Zachary on 2/2/24.
//

import SwiftUI
import Observation

@Observable class seriesElement {
    func series1Element(N: Int) async -> (Int, Float){
        
        let newN = Float(N)
        var sum :Float = 0.0
        
        for i in 1...2*N{
            
            sum += Float(pow(-1.0, newN))*newN/(newN+1)
            
        }
        
        return (N, sum)
    }
    
    func series2Element(N: Int) async -> (Int, Float){
        
        let newN = Float(N)
        var sumnegative :Float = 0.0
        var sumpositive :Float = 0.0
        
        for i in 1...N{
            
            sumnegative += Float(2*N - 1)/Float(2*N)
            sumpositive += Float(2*N)/Float(2*N + 1)
            
        }
        
        let sum = -1*sumnegative+sumpositive
        
        return (N, sum)
    }
    
    func series3Element(N: Int) async -> (Int, Float){
        
        let newN = Float(N)
        var sum :Float = 0.0
        
        for i in 1...N{
            
            sum += 1/Float(2*N*(2*N + 1))
            
        }
        
        return (N, sum)
    }
}
