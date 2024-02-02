//
//  Series Calculator.swift
//  Finite Series Subtraction Error
//
//  Created by Phys440Zachary on 1/26/24.
//

import SwiftUI
import Observation

@Observable class FiniteSeries {
    
    var maxIndex: Int = 1
    var series1Result: Float = 0.0
    var series2Result: Float = 0.0
    var series3Result: Float = 0.0
    
    func computeSeries(N: Int) -> Float {
        
        Task{
            
            let combinedResults = await withTaskGroup(of: (Int, Float).self,
                                                      returning:[(Int,Float)].self,
                                                      body: { taskGroup in
                for seriesNIndex in stride(from: 1, through: 2*N, by: 1){
                    
                    taskGroup.addTask{
                        let elementValue = await seriesElement().series1Element(N: seriesNIndex)
                        
                        return (seriesNIndex, elementValue)
                    }
                }
                var combinedTaskResults :[(Int, Float)] = []
                for await result in taskGroup {
                    combinedTaskResults.append(result)
                }
                
                return combinedTaskResults
            })
            
            let sortedCombinedResults = combinedResults.sorted(by: { $0.0 < $1.0 })
            var seriesResult: Float = 0.0
            for item in sortedCombinedResults{
                seriesResult = seriesResult + item.1
            }
            series1Result = seriesResult
            return seriesResult
        }
    }
}
