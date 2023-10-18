
import SwiftUI

struct ImcView: View {
    @StateObject var viewModel = ImcViewModel(color: .indigo)
    @State var title = "Calcule seu IMC"
    @State var activate = false
    @State var changeText = false
    
    var body: some View {
        VStack {
            
            Spacer()
            
            VStack(spacing: 10) {
                Text(changeText ? viewModel.message : title)
                    .font(.system(size: 33))
                    .bold()
                    .foregroundStyle(viewModel.color)
                Text("\(viewModel.stringResult)")
                    .font(.system(size: 22))
                    .foregroundStyle(.secondary)
                    .bold()
            }
            .padding(.bottom, 40)
            
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
                
                activate = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
                    activate = false
                    changeText = true
                }
                
            } label: {
                if activate {
                    ProgressView()
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 20)
                        .background(.indigo)
                        .foregroundStyle(.white)
                        .clipShape(.rect(cornerRadius: 8))
                } else {
                    Text("Enviar")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 20)
                        .font(.system(size: 17))
                        .background(.indigo)
                        .foregroundStyle(.white)
                        .bold()
                        .clipShape(.rect(cornerRadius: 8))
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
