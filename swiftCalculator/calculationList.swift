
import SwiftUI


// TODO: Add screen to see previous calculations that the user has made before


struct CalculationList: View {
	@State private var showContentView: Bool = false
	@Binding var history: [String]
	
	
	var body: some View {
		
		
			//this list is just a placeholder for now (Soon to be a forEach loop to generate and include the previous results)
		VStack {
			
			ForEach(history, id: \.self){ result in
				Text(result)
			}
			
			Button("Remove all"){
				history.removeAll()
			}
			.buttonStyle(GlassButtonStyle())
		
		}
		
	}
	
	
	
}
        


#Preview {
	CalculationList(history: .constant(["1 + 1 = 2"]))
}
