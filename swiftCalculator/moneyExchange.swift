import Foundation
import SwiftUI










struct MoneyExchange: View {
	
	var body: some View {
		VStack{
			
			Menu("Select Currency"){
				Button("American Dollar"){
						// calculation
				}
				Button("Canadian Dollar"){
						// calculation
				}
				Button("Euro"){
						// calculation
				}
				
			}
		}
		.background(Color.blue)
		}
	}


#Preview {
	MoneyExchange()
}
