import Foundation
import SwiftUI










struct MoneyExchange: View {
	
	var body: some View {
		
		Text("There will be a menu here to do money exchange from one currency to another")
			.font(Font.largeTitle)
		Spacer()
		VStack{
			
			Menu("Select Currency"){
				Button("American Dollar"){
					
				}
				Button("Canadian Dollar"){
					
				}
				Button("Euro"){
					
				}
				
			}
			
			
			
			
			
		}
		Spacer()
	}
}

#Preview {
	MoneyExchange()
}
