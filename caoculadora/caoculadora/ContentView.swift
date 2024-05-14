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
    @State var porte = "Pequeno"
    @State var porteSelecionado = Portes.pequeno
     
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Spacer()
                Text("Qual a idade do seu cão?").font(.header5)
                Spacer()
                Text("Anos").font(.body1)
                TextField("Quantos anos completos tem seu cão",
                          value: $years,
                          format: .number )
                Text("Meses").bold()
                TextField("E quantos meses alem disse ele tem",
                          value: $months,
                          format: .number)
                Divider()
                Text("Porte").bold()
                
                Picker("Portes", selection: $porteSelecionado) {
                    ForEach(Portes.allCases, id: \.self) { porte in Text(porte.rawValue.capitalized)}
                }.pickerStyle(.segmented)
                Spacer()
                if let result { Text("Seu cachorro tem, em idade humana...")
                    Text("\(result) anos ") }
                else {
                    Image(ImageResource.clarinha).resizable().scaledToFit().frame(maxHeight: 250)
                    .frame(maxWidth: .infinity).shadow(radius: 50) }
                Spacer()
                Button("Cãocular", action: processYears)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(.indigo)
                    .foregroundStyle(.white)
                    .clipShape(.rect(cornerRadius: 10))
                Spacer()
            }
            .textFieldStyle(.roundedBorder)
            .keyboardType(.numberPad)
            .padding()
            .navigationTitle("Cãoculadora")
        }
    }
    func processYears() {
        print("cãocular")
        
        guard let years, let months else {
            print("campos nao preenchidos")
            return
        }
        
        guard months > 0 || years > 0 else {
            print("pelo menos um campo deve ser maior que zero")
            return
        }
        
        result = porteSelecionado.calcularIdade(aCaninos: years
                                        , mCaninos: months)
        
    }
    
    enum Portes: String, CaseIterable {
        case pequeno = "Pequeno"
        case medio = "Médio"
        case grande = "Grande"
        
        func calcularIdade(aCaninos aCaninos: Int, mCaninos mCaninos: Int) -> Int {
            
            let multiplicador: Int
            let resultado: Int
            
            switch self {
            case .pequeno:
                multiplicador = 6
            case .medio:
                multiplicador = 7
            case .grande:
                multiplicador = 8
            }
            resultado = aCaninos * multiplicador + mCaninos * multiplicador / 12
            
            return resultado
        }
            
    }
    
}

#Preview {
    ContentView()
}
