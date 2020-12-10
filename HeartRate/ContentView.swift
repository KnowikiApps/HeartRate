//
//  ContentView.swift
//  HeartRate
//
//  Created by Derek Nowicki on 12/8/20.
//  Copyright © 2020 Knowiki Apps. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {

    @State var tabIndex:Int = 0

    var body: some View {
        
        TabView(selection:$tabIndex){
            LineCharts().tabItem { Group{
                Image(systemName: "waveform.path.ecg")
                Text("Heart Rate Monitor")
                }}.tag(1)
        }

    }
}

struct LineCharts:View {
    @State var vals: [Double]=[200,250,212,192,203,199,189,215,243]
    @State var timeRemaining = 100
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack{
            LineChartView(data: vals, title: "Heart Rate", legend: "BPM")
                .onReceive(timer) { _ in
                    if self.timeRemaining > 0{
                        self.timeRemaining -= 1
                        self.vals.append(Double.random(in: 195.0...265.0))
                        self.vals.remove(at: 0)
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
