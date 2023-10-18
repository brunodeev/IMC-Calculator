
import SwiftUI
import Foundation

class ImcViewModel: ObservableObject {
    @Published var weight = ""
    @Published var height = ""
    @Published var result = 0.0
    @Published var stringResult = ""
    @Published var message = ""
    @Published var color: Color
    
    init(color: Color) {
            self.color = color
    }
    
    func calculate() {
        guard weight != "" || height != "" || !weight.isEmpty || !height.isEmpty else {
            return
        }
        let doubleWeight = Double(weight)
        let doubleHeight = Double(height)
        
        result = doubleWeight! / (doubleHeight! * doubleHeight!)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            self.stringResult = String(format: "%.1f", self.result)
        }
    }
    
    func verify() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            if(self.result >= 40.0) {
                self.message = "Obesidade Grau III"
                self.color = Color(.red)
            } else if(self.result >= 35.0) {
                self.message = "Obesidade Grau II"
                self.color = Color(.orange)
            } else if(self.result >= 30.0) {
                self.message = "Obesidade Grau I"
                self.color = Color(.yellow)
            } else if(self.result >= 25.0) {
                self.message = "Sobrepeso"
                self.color = Color(.blue)
            } else if(self.result >= 18.6) {
                self.message = "Normal"
                self.color = Color(.cyan)
            } else {
                self.message = "Abaixo do Peso"
                self.color = Color(.orange)
            }
            
            self.weight = ""
            self.height = ""
        }
    }
}
