// ContentView.swift
//  Caoculadora-xcodeArquivo
//
//  Created by Marina Meirelles Paixão on 07/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var years: Int?
    
    @State var months: Int?
    
    @State var result: Int?
    
    let portes = ["Pequeno", "Médio", "Grande"]
    @State var porteSelecionado = "Pequeno"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20.0) {
            
            Spacer()
            
            Text("Qual a idade do seu cão?")
                .fontWeight(.bold)
                .foregroundColor(Color.indigo)
                .font(.system(size: 24))
            
            VStack(alignment: .leading, spacing: 8.0) {
                Text("Anos")
                    .foregroundColor(Color.indigo)
                    .font(.system(size: 16, weight: .bold))
                
                TextField(
                    "Quantos anos completos tem seu cão?",
                    value: $years,
                    format: .number
                )
            }
            
            VStack(alignment: .leading, spacing: 8.0) { Text("Meses")
                    .foregroundColor(Color.indigo)
                    .font(.system(size: 16, weight: .bold))
                
                
                TextField(
                    "E quantos meses além disso ele tem?",
                    value: $months,
                    format: .number
                )
            }
            
            Text("Porte")
                .foregroundColor(Color.indigo)
                .font(.system(size: 16, weight: .bold, design:.rounded))
            
            //segmented control
            
            //                @State var number: Int = 0
            //
            //                    Picker("Number Picker", selection: $number) {
            //                        Text("Pequeno")
            //                            .tag(0)
            //                        Text("Médio")
            //                            .tag(1)
            //                        Text("Grande")
            //                            .tag(2)
            //                    }
            //                    .pickerStyle(.segmented)
            //                    //.padding()
            Picker("Portes", selection: $porteSelecionado)
            {
                ForEach(portes, id:\.self) {porte in Text(porte)
                }
            }
            .pickerStyle(.segmented)
            
            Spacer()
            
            if let result {
                Text("Seu cachorro tem, em idade humana...")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color.indigo)
                    .bold()
                    .font(.system(size: 16, weight: .bold, design:.rounded))
                Text("\(result) anos")
                    .font(.system(size: 60, weight: .bold, design:.rounded))
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color.indigo)
            } else {
                Image(ImageResource.clarinha)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 150)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
//                    .shadow(radius: 5)
            }
            
            Spacer()
            
            Button("Cãocular", action: processYears)
                .font(.system(size: 16, weight: .bold, design:.rounded))
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .frame(height: 50)
                .background(.indigo)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .bold()
            
        }
        .textFieldStyle(.roundedBorder)
        .keyboardType(.numberPad)
        .padding()
    }
    func processYears() {
        print("cãocular")
        
        guard let years, let months else {
            print("Campo não preenchido")
            return
        }
        
        guard months > 0 || years > 0 else {
            print("Pelo menos um campo deve ser maior que zero")
            return
        }
        
        // o resultado vai ser os anos * multiplicador + a fração do ano em meses * 7
        //multiplicador:
        // * pequeno: 6
        // * médio: 7
        // * grande: 8
        
        let multiplicador: Int
        switch porteSelecionado {
        case "Pequeno":
            multiplicador = 6
        case "Médio":
            multiplicador = 7
        case "Grande":
            multiplicador = 8
        default:
            multiplicador = 0
        }
        
        result = years * multiplicador + months * multiplicador/12
    }
}

#Preview {
    ContentView()
}
