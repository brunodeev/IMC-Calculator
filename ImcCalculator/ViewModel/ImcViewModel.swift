import Foundation

class ImcViewModel: ObservableObject {
    @Published var weight = ""
    @Published var height = ""
    @Published var result = 0.0
    @Published var message = ""
    
    init() {}
    
    func calculate() {
        guard weight != "" || height != "" || !weight.isEmpty || !height.isEmpty else {
            return
        }
        let doubleWeight = Double(weight)
        let doubleHeight = Double(height)
        
        result = doubleWeight! / (doubleHeight! * doubleHeight!)
    }
    
    func verify() {
        if(result >= 40.0) {
            message = "Obesidade Grau III"
        } else if(result >= 35.0) {
            message = "Obesidade Grau II"
        } else if(result >= 30.0) {
            message = "Obesidade Grau I"
        } else if(result >= 25.0) {
            message = "Sobrepeso"
        } else if(result >= 18.6) {
            message = "Normal"
        } else {
            message = "Abaixo do Peso"
        }
        weight = ""
        height = ""
    }
}
