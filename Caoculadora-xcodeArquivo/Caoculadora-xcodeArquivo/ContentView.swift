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
    
//    let portes = ["Pequeno", "Médio", "Grande"]
//    @State var porteSelecionado = "Pequeno"
    @State var porteSelected = Porte.pequeno
    
    
// MARK: - VSTACK
    var body: some View {
        VStack(alignment: .leading, spacing: 20.0) {
            
            Spacer()
            
            Text("Qual a idade do seu cão?")
                .foregroundColor(Color.indigo)
                .font(.header5)
// MARK: - ANOS
            VStack(alignment: .leading, spacing: 8.0) {
                Text("Anos")
                    .foregroundColor(Color.indigo)
                    .font(.body1)
                
                TextField(
                    "Quantos anos completos tem seu cão?",
                    value: $years,
                    format: .number
                )
            }
// MARK: - MESES
            VStack(alignment: .leading, spacing: 8.0) { Text("Meses")
                    .foregroundColor(Color.indigo)
                    .font(.body1)
                
                
                TextField(
                    "E quantos meses além disso ele tem?",
                    value: $months,
                    format: .number
                )
            }
// MARK: - PORTE
            Text("Porte")
                .foregroundColor(Color.indigo)
                .font(.body1)
            
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
// MARK: - PICKER
            Picker("Portes", selection: $porteSelected)
            {
                ForEach(Porte.allCases, id:\.self) {porte in Text(porte.rawValue)
                }
            }
            .pickerStyle(.segmented)
            
            Spacer()
// MARK: - CLARINHA OU RESULTADO
            if let result {
                Text("Seu cachorro tem, em idade humana...")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color.indigo)
                    .bold()
                    .font(.body1)
                Text("\(result) anos")
                    .font(.display)
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
// MARK: - BOTÃO
            Button("Cãocular", action: processYears)
                .font(.body1)
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
        switch porteSelected {
        case .pequeno:
            multiplicador = 6
        case .médio:
            multiplicador = 7
        case .grande:
            multiplicador = 8
        }
        
//        Picker("Portes", selection: $porteSelecionado)
//        {
//            ForEach(portes, id:\.self) {porte in Text(porte)
//        let multiplicador: Int
//        switch porteSelecionado {
//        case "Pequeno":
//            multiplicador = 6
//        case "Médio":
//            multiplicador = 7
//        case "Grande":
//            multiplicador = 8
//        default:
//            multiplicador = 0
        
        result = years * multiplicador + months * multiplicador/12
    }
}

#Preview {
    ContentView()
}
