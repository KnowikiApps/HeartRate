//
//  ContentView.swift
//  HeartRate
//
//  Created by Derek Nowicki on 12/8/20.
//  Copyright © 2020 Knowiki Apps. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var vals: [(x: Int, y: Int)] = [(10,10)]
    var body: some View {
        VStack {
            Text("Line Graph Generator")
            Button(action: {
                var ex = self.vals.last.unsafelyUnwrapped.x
                let why = Int.random(in: 0...100)
                if(self.vals.count > 100){
                    self.vals.removeFirst()
                    for i in self.vals.indices{
                        self.vals[i].x -= 3
                    }
                }else{
                    ex += 3
                }
                self.vals.append((x: ex, y: why))
                print("x: \(ex), y: \(why) vals: \(self.vals.count)")
            }){Text("Click to generate a new value")}
            Path{
                path in
                path.move(to: CGPoint(x: 10, y: 200))
                for val in vals {
                    path.addLine(to: CGPoint(x: val.x+10, y: 200-val.y))
                }
            }.stroke(Color.blue, lineWidth: 2)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
