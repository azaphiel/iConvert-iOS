//
//  ContentView.swift
//  iConvert
//
//  Created by Özkan Adar on 10/03/2020.
//  Copyright © 2020 Özkan Adar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    @State private var value = ""
    let units = ["Celcius °C", "Fahrenheit °F", "Kelvin K"]
    
    var calculate: Double {
        let newValue = Double(value) ?? 0
        
        if inputUnit == 0  {
            switch outputUnit {
            case 0:
                return newValue
            case 1:
                let ctoF = Double(newValue) * 1.80 + 32.00
                return ctoF
            case 2:
               return newValue + 273
            default:
                return 0
            }
        }
        
        if inputUnit == 1  {
            switch outputUnit {
            case 0:
                return (5/9) * (newValue-32)
            case 1:
                return newValue
            case 2:
                return (5/9) * (newValue-32) + 273
            default:
                return 0
            }
        }
        
        if inputUnit == 2  {
            switch outputUnit {
            case 0:
                return newValue - 273
            case 1:
                return (9/5) * (newValue-273)+32
            case 2:
                return newValue
            default:
                return 0
            }
        }
        
        return 0
    }
   
    var body: some View {
        NavigationView {
            
            Form {
                Section(header: Text("Input unit")) {
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(0 ..< units.count) {
                            Text("\(self.units[$0])")
                             
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                     
                    
                        Section(header: Text("Output unit")) {
                            Picker("Output Unit", selection: $outputUnit) {
                                ForEach(0 ..< units.count) {
                                    Text("\(self.units[$0])")
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                        }
                Section(header: Text("Original value")) {
                    TextField("0", text: $value)
                }
                .keyboardType(.numberPad)
                Section(header: Text("Converted value")) {
                    Text("\(calculate, specifier: "%.2f")")
                }
                
                }.navigationBarTitle("iConvert")
            }
        }
    
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
