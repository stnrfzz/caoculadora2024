//
//  ContentView.swift
//  caoculadora
//
//  Created by Caio Silva on 07/05/24.
//

import SwiftUI

struct ContentView: View {
    @State var years: Int?
    @State var months: Int?
    var body: some View {
        VStack(alignment: .leading) {
            Text("Qual a idade do seu cão?")
            Text("Anos")
            TextField("Quantos anos completos tem seu cão",
                value: $years,
                format: .number )
            Text("Meses")
            TextField("E quantos meses alem disse ele tem",
                value: $months,
                format: .number)
            
        }
        .textFieldStyle(.roundedBorder)
        .keyboardType(.numberPad)
        .padding()
    }
}

#Preview {
    ContentView()
}
