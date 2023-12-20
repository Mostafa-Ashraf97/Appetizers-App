//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by A on 17/12/2023.
//

import SwiftUI

struct AppetizerDetailView: View {
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    @EnvironmentObject var order: Order
    
    var body: some View {
        VStack{
            AppetizersImage(imageURL: appetizer.imageURL)
                .frame(width: 300, height: 200)
                .aspectRatio(contentMode: .fit)
            
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding()
                
                Text(appetizer.description)
                    .font(.body)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .padding()
                
                HStack (spacing: 50) {
                    NutritionInfo(title: "Calories", value: appetizer.calories)
                    NutritionInfo(title: "Carbs", value: appetizer.carbs)
                    NutritionInfo(title:  "Protein", value: appetizer.protein)
                }
                .padding()
                
            }
            Spacer()
            
            Button {
                order.items.append(appetizer)
                isShowingDetail = false
            } label: {
                AppetizerButton(title: "$ \(appetizer.price, specifier: "%.2f") - Add to Order")
            }
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 550)
        .background(.background)
        .cornerRadius(15)
        .shadow(radius: 50)
        .overlay(Button(action: {
            isShowingDetail = false
        }, label: {
            XDismissButton()
        })
                 , alignment: .topTrailing)
        
    }
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(false))
    }
}

struct NutritionInfo: View {
    
    let title: String
    let value: Int
    
    var body: some View {
        VStack (spacing: 5) {
            Text(title)
                .font(.caption)
                .bold()
            Text("\(value)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
