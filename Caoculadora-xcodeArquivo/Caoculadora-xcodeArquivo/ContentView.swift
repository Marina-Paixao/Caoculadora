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
    @State var campoVazio = false
    let tituloPreencherCampo = "Preencha os todos os campos para cãocular!"
    
    
    // MARK: - VSTACK
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20.0) {
                    
                    //                    Spacer()
                    
                    Text("Qual a idade do seu cão?")
                        .foregroundColor(Color.indigo600)
                        .font(.header5)
                        .padding(.top, 15.0)
                    // MARK: - ANOS
                    VStack(alignment: .leading, spacing: 8.0) {
                        Text("Anos")
                            .foregroundColor(Color.indigo600)
                            .font(.body1)
                        
                        TextField(
                            "Quantos anos completos tem seu cão?",
                            value: $years,
                            format: .number
                        )
                    }
                    // MARK: - MESES
                    VStack(alignment: .leading, spacing: 8.0) { Text("Meses")
                            .foregroundColor(Color.indigo600)
                            .font(.body1)
                        
                        
                        TextField(
                            "E quantos meses além disso ele tem?",
                            value: $months,
                            format: .number
                        )
                    }
                    // MARK: - PORTE
                    Text("Porte")
                        .foregroundColor(Color.indigo600)
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
                            .foregroundColor(Color.indigo600)
                            .bold()
                            .font(.body1)
                        Text("\(result) anos")
                            .font(.display)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color.indigo600)
                            .contentTransition(.numericText())
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
                        .background(.indigo600)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .bold()
                    
                }
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .padding()
                .containerRelativeFrame(.vertical)
                //                .animation(.easeInOut.speed(0.5), value: result)
            }
            .alert(tituloPreencherCampo, isPresented: $campoVazio, actions: {
                Button("OK", role: .cancel, action: {})
            })
            .navigationTitle("Cãoculadora")
            .scrollDismissesKeyboard(.immediately)
            .toolbarBackground(.indigo, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
        .fontDesign(.rounded)
    }
}
extension ContentView {
    func processYears() {
        print("cãocular")
        
        guard let years, let months else {
            print("Campo não preenchido")
            campoVazio = true
            return
        }
        
        guard months > 0 || years > 0 else {
            print("Pelo menos um campo deve ser maior que zero")
            return
//Adicionar alerta caso o campo preenchido de anos e meses seja menor que zero?
        }
        withAnimation(.easeInOut.speed(0.5)){
            result = porteSelected.calcularIdade(deAnos: years, eMeses: months)
        }
    }
}
#Preview {
    ContentView()
}
