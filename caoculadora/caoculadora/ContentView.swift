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
    @State var result: Int?
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
            Text("Porte")
            //segmentcontrol
            if let result { Text("Seu cachorro tem, em idade humana...")
                Text("\(result) anos ") }
            else {
                Image(ImageResource.clarinha).resizable().scaledToFit().frame(maxHeight: 150)
                .frame(maxWidth: .infinity) }
            
            Button("Cãocular") {
                print("caocular")
            }
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(.indigo)
            .foregroundStyle(.white)
            .clipShape(.rect(cornerRadius: 10))
        }
        .textFieldStyle(.roundedBorder)
        .keyboardType(.numberPad)
        .padding()
    }
}

#Preview {
    ContentView()
}
