//
//  ListScreen.swift
//  SwiftUILearning
//
//  Created by unkn0wn on 2/22/23.
//

import SwiftUI

struct ListScreen: View {
    var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    var days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    var sections = ["Section Months", "Section Days"]
    
    @StateObject var viewModel: EmployeeViewModel
    @State var isErrorOcurred: Bool = false
    @State var isShown: Bool = false
    @State var screenTitle: String = "ListScreen"
    @AppStorage("userID") var userID = 10
    
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        VStack {
            Button("Present NextView") {
                print("Present NextView Clicked")
                isShown = true
                coordinator.presentImageDisplayScreen()
            }
            
            Text(screenTitle).padding(20)
            
            Text("\(userID)")
            
            List {
                if viewModel.customError != nil {
                    ProgressView().alert(isPresented: $isErrorOcurred) {
                        Alert(title: Text("Ooops Something Went Wrong!"), message: Text(viewModel.customError?.errorDescription ?? ""), dismissButton: .default(Text("Okay")))
                    }
                } else {
                    ForEach(sections, id: \.self) { section in
                        Section(section) {
                            if section == "Section Months" {
                                //                        ForEach(months, id: \.self) { month in
                                //                            NavigationLink {
                                //                                DetailsScreen(detailTitle: month)
                                //                            } label: {
                                //                                ListCell(cellTitle: month)
                                //                            }
                                //                        }
                                ForEach(viewModel.employeeList) { employee in
//                                    NavigationLink {
                                    Button {
//                                        DetailsScreen(detailTitle: employee.firstName)
                                        coordinator.navigateToDetailsScreen(data: employee)
                                    } label: {
                                        ListCell(cellTitle: employee.firstName, imageURL: employee.avatar)
                                    }
                                }
                            } else {
                                ForEach(days, id: \.self) { day in
//                                    NavigationLink {
                                    Button {
//                                        GridView()
                                        coordinator.navigateToGridView()
                                    } label: {
                                        Text(day)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
//        .sheet(isPresented: $isShown) {
//            PresentedView(isShown: $isShown, titleName: $screenTitle)
//        }
//        .onAppear {
//            Task {
//                await viewModel.getEmployeeList(urlString: APIEndpoints.EmployeeEndpoint)
//            }
//        }
        .task {
            await callAPI()
            if viewModel.customError != nil {
                isErrorOcurred = true
            } else {
                viewModel.customError = nil
            }
        }
        .refreshable {
            await callAPI()
            if viewModel.customError != nil {
                viewModel.customError = nil
                isErrorOcurred = false
            } else {
                viewModel.customError = nil
                isErrorOcurred = false
            }
        }
    }
    
    func callAPI() async {
        await viewModel.getEmployeeList(urlString: APIEndpoints.EmployeeEndpoint)
    }
    
}

struct ListScreen_Previews: PreviewProvider {
    static var previews: some View {
        ListScreen(viewModel: EmployeeViewModel(networkable: NetworkManager()))
    }
}
