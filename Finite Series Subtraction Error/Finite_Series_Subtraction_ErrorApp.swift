//
//  Finite_Series_Subtraction_ErrorApp.swift
//  Finite Series Subtraction Error
//
//  Created by Phys440Zachary on 1/26/24.
//

import SwiftUI
import Observation

@main
struct Finite_Series_Subtraction_ErrorApp: App {
    
    @State var plotData = PlotClass()
    
    var body: some Scene {
        WindowGroup {
                ContentView()
                    .environment(plotData)
                    .tabItem {
                        Text("Plot")
                    }
        }
    }

}
