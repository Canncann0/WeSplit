//
//  ContentView.swift
//  WeSplit
//
//  Created by Cancan on 29.01.2025.
//  SwiftUI Practice 

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 0
    let tipPercentages = [0,10, 15, 20, 25]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    
    var body: some View {
        NavigationStack {
            Form{
                Section{
                
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? ("USD")))
                        .keyboardType(.decimalPad)
                    
                    Picker(selection: $numberOfPeople) {
                        ForEach(2..<6) {
                            Text("\($0) People")
                        }
                    } label: {
                        Text("Number of People")
                    }
                    .pickerStyle(.navigationLink)

                }
                
                Section ("How much tip do want to leave ?"){
                    
                    Picker(selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self){
                            Text($0, format: .percent)
                        }
                    } label: {
                        Text("Tip Percentage")
                    }
                    .pickerStyle(.segmented)

                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? ("USD")))
                }
                
            }
            .navigationTitle("We Split")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        
    }
}

#Preview {
    ContentView()
}
