//
//  Settings.swift
//  UIDemo
//
//  Created by 何强 on 2019/12/17.
//  Copyright © 2019 何强. All rights reserved.
//

import SwiftUI

struct Settings: View {
    @State var receive: Bool = false
    @State var number = 4
    @State var selection = 1
    @State var date = Date()
    @State var email = ""
    @State var submit = false
    
    var body: some View {
        
        NavigationView{
            Form {

                Toggle(isOn: $receive) {
                    Text("Receive notifications")
                }.padding()

                Stepper(value: $number, in: 1...10){
                    Text("\(number) Notification\(number > 1 ? "s" : "") per week")
                }

                Picker(selection: $selection, label: Text("Favorite course")){
                    Text("SwiftUI").tag(1)
                    Text("React").tag(2)
                }

                DatePicker(selection: $date){
                    Text("Date")
                }

                Section(header: Text("Email")){
                    TextField("Your email", text: $email).textFieldStyle(RoundedBorderTextFieldStyle())
                }
             
                Button(action: {self.submit.toggle()}) {
                    Text("Submit")
                }
                .alert(isPresented: $submit){
                    Alert(title: Text("Thanks!"), message:Text("Email: \(email)"))
                }

            }
            .navigationBarTitle("Settings")
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
