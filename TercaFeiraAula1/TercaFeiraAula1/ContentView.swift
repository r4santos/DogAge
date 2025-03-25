//
//  ContentView.swift
//  TercaFeiraAula1
//
//  Created by COTEMIG on 11/03/25.
//

import SwiftUI


struct ContentView: View {
    @State private var userAge: String = ""
    @State private var dogAge: String = ""
    @State private var showAlert = false
    
    func humanAgeCalculate() -> Void {
        
        if let age = Int(userAge), age > 0 {
            let resultado = age * 7
            dogAge = "A idade canina correspondente é: \(resultado) anos"
        } else {
            dogAge = "Digite um numero valido!"
        }
        
        showAlert = true
        
        userAge = ""
    }
    
    var body: some View {
        VStack {
            Image("marshall")
                .resizable()
                .scaledToFit()
            Text("Calculadora de Idade Canina")
            
            TextField(
                "Digite a idade humana",
                text: $userAge
            )
            
            Button(action: humanAgeCalculate){
                Text("Calcular")
            }
            
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Resultado"),
                    message: Text(" \(dogAge)"),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
