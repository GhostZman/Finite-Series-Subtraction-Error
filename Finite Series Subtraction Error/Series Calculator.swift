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
                body: { taskgroup in
                    for seriesIndex in 0...(2*N) {
                        taskgroup.add{ let seriesNResult: (Float) = pow(-1,seriesIndex)*(seriesIndex)/(seriesIndex + 1)
                            return seriesNResult
                        }
                    }
                    var combinedTaskResults: [Float] = []
                    for await result in taskgroup{
                        combinedTaskResults.append(result)
                    }
                    return combinedTaskResults
            })
            let sortedCombinedResults = returnedResults.sorted(by: { $0.0 < $1.0})
        }
        let seriesResult = 0
        for result in combinedTaskResults{
            seriesResult += result
        }
        
        self.series1Result = seriesResult
        return seriesResult
    }
}
