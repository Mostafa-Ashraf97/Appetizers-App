//
//  AppetizersListView.swift
//  Appetizers
//
//  Created by A on 10/12/2023.
//

import SwiftUI

struct AppetizersListView: View {
    
    @StateObject var viewModel = AppetizersListViewModel()
    
    
    var body: some View {
        ZStack {
            NavigationView{
                List(viewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .listRowSeparator(.automatic)
                    
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetil = true
                        }
                }
                .navigationTitle("Appetizers List")
                .listStyle(.plain)
                .disabled(viewModel.isShowingDetil)
                
            }
            .onAppear() {
                viewModel.getAppetizers()
            }
            .blur(radius: viewModel.isShowingDetil ? 20 : 0)
            
            
            if viewModel.isShowingDetil {
                AppetizerDetailView(appetizer: viewModel.selectedAppetizer ?? MockData.sampleAppetizer, isShowingDetail: $viewModel.isShowingDetil)
            }
            
            if viewModel.isLoading {
                activityIndicator()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
        
    }
    
}

struct AppetizersListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizersListView()
    }
}
