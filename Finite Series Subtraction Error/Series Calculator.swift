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
                    for seriesIndex in 1...(2*N) {
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
        }
        let seriesResult: Float = 0.0
        for result in returnedResults{
            seriesResult += result
        }
        
        self.series1Result = seriesResult
        return seriesResult
    }


    func computeSeries2(N: Int) -> Float {
        Task{
            let firstReturnedResults = await withTaskGroup(
                of: Float,
                returning: Float,
                body: { taskgroup in
                    for seriesIndex in 1...N {
                        taskgroup.add{ let seriesNResult: (Float) = (2*seriesIndex - 1)/(2*seriesIndex)
                            return seriesNResult
                        }
                    }
                    var combinedTaskResults: [Float] = []
                    for await result in taskgroup{
                        combinedTaskResults.append(result)
                    }
                    return combinedTaskResults
            })
            
            let secondReturnedResults = await withTaskGroup(
                of: Float,
                returning: Float,
                body: { taskgroup in
                    for seriesIndex in 1...N {
                        taskgroup.add{ let seriesNResult: (Float) = (2*seriesIndex)/(2*seriesIndex + 1)
                            return seriesNResult
                        }
                    }
                    var combinedTaskResults: [Float] = []
                    for await result in taskgroup{
                        combinedTaskResults.append(result)
                    }
                    return combinedTaskResults
            })
        }
        let seriesResult: Float = 0.0
        for result in firstReturnedResults{
            seriesResult -= result
        }
        for result in secondReturnedResults{
            seriesResult += result
        }
        self.series2Result = seriesResult
        return seriesResult
    }

func computeSeries3(N: Int) -> Float {
        Task{
            let returnedResults = await withTaskGroup(
                of: Float,
                returning: Float,
                body: { taskgroup in
                    for seriesIndex in 1...N {
                        taskgroup.add{ let seriesNResult: (Float) = 1/(2*seriesIndex*(2*seriesIndex + 1))
                            return seriesNResult
                        }
                    }
                    var combinedTaskResults: [Float] = []
                    for await result in taskgroup{
                        combinedTaskResults.append(result)
                    }
                    return combinedTaskResults
            })
        }
        let seriesResult: Float = 0.0
        for result in returnedResults{
            seriesResult += result
        }
        
        self.series3Result = seriesResult
        return seriesResult
    }
}
