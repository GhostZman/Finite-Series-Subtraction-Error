//
//  Series Calculator.swift
//  Finite Series Subtraction Error
//
//  Created by Phys440Zachary on 1/26/24.
//

import Foundation
import SwiftUI
import Observation

@Observable class FiniteSeries {
    
    var maxIndex: Int = 1
    var series1Result: Float = 0.0
    var series2Result: Float = 0.0
    var series3Result: Float = 0.0
    
    var plotDataModel: PlotDataClass? = nil
    var theText = ""
    
    func computeSeries(N: Int){
        
        Task{
            
            let combinedResults = await withTaskGroup(of: (Int, Float).self,
                                                      returning:[(Int,Float)].self,
                                                      body: { taskGroup in
                
                taskGroup.addTask{
                    let series1 = await SeriesElement().series1Element(N: N)
                    
                    return series1
                }
                
                taskGroup.addTask{
                    let series2 = await SeriesElement().series2Element(N: N)
                    
                    return series2
                }
                
                taskGroup.addTask{
                    let series3 = await SeriesElement().series3Element(N: N)
                    
                    return series3
                }
                
                var combinedTaskResults :[(Int, Float)] = []
                for await result in taskGroup {
                    combinedTaskResults.append(result)
                }
                return combinedTaskResults
            })
            let sortedCombinedResults = combinedResults.sorted(by: { $0.0 < $1.0 })
            self.series1Result = sortedCombinedResults[0].1
            self.series2Result = sortedCombinedResults[1].1
            self.series3Result = sortedCombinedResults[2].1
        }
    }
    
    func plotserieserror() async {
        
        await resetCalculatedTextOnMainThread()
        
        theText = "y = Series Error"
        
        var plotData :[(x: Double, y: Double)] = []
        for i in 1 ... maxIndex {
            let x = i
            
            computeSeries(N: i)
            
            let y =
        }
    }
    
    @MainActor func resetCalculatedTextOnMainThread() {
        //Print Header
        plotDataModel!.calculatedText = ""

    }
}
