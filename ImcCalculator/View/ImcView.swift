
import SwiftUI

struct ImcView: View {
    @StateObject var viewModel = ImcViewModel()
    @State var title = "Calcule seu IMC"
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Text(title)
                .font(.system(size: 33))
                .bold()
                .padding(.bottom, 50)
            
            TextField("Peso", text: $viewModel.weight)
                .padding(.horizontal)
                .frame(height: 60)
                .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.indigo, lineWidth: 5)
                    )
                .clipShape(.rect(cornerRadius: 8))
            
            TextField("Altura", text: $viewModel.height)
                .padding(.horizontal)
                .frame(height: 60)
                .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.indigo, lineWidth: 5)
                    )
                .clipShape(.rect(cornerRadius: 8))
            
            Button {
                viewModel.calculate()
                viewModel.verify()
                
                title = viewModel.message
                
                
                print(viewModel.result)
                
                print(viewModel.message)
            } label: {
                ZStack {
                    RoundedRectangle(cornerSize: CGSize(width: 8, height: 8))
                        .fill(viewModel.weight.isEmpty || viewModel.height.isEmpty ? .indigo.opacity(0.5) : .indigo)
                        .frame(width: 360, height: 60)
                    Text("Enviar")
                        .font(.system(size: 17))
                        .foregroundStyle(.white)
                        .bold()
                }
            }
            .disabled(viewModel.weight.isEmpty || viewModel.height.isEmpty)
            .padding(.top, 40)

            
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    ImcView()
}
