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
    var body: some View {
        VStack{
            LineChartView(data: [200,250,212,192,203,199,189,215,243], title: "Heart Rate")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
