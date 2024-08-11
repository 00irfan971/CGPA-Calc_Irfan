//
//  DataSheetView.swift
//  CGPA Calc
//
//  Created by Irfan on 03/08/24.
//

import SwiftUI

struct DataSheetView: View {
    @Binding var userdata:userData
    
    @State private var selectedIndex = 0
    
    @Environment(\.dismiss) private var dismiss
    
    let onSave: () -> Void
    
    let numbers = [1, 2, 3, 4, 5,6]
    
    let grades = ["S","A","B","C","D","E"]
    
    var body: some View {
        ZStack{
            Color.black.opacity(0.92).ignoresSafeArea()
            
            VStack{
                
                Text("Add Course").foregroundColor(.white).font(.system(size: 45,weight: .bold)).frame(width: 350,alignment: .leading)
                
                Section(header: Text("Course Name").frame(width:350,alignment: .leading).font(.system(size: 16)).foregroundColor(.gray)) 
                {
                    TextField("Name", text: $userdata.Course).frame(width: 350,height: 30).background(Color("MyGray")).cornerRadius(5).foregroundColor(.white).padding(.bottom)
                    
                }
                
                
                    
                    Section(header: Text("Credit Hours").frame(width:350,alignment: .leading).font(.system(size: 16)).foregroundColor(.gray)){
                        
                        Picker("",selection: $userdata.credits){
                            ForEach(numbers,id:\.self){
                                number in Text(String(number)).foregroundColor(.white)
                            }
                        }.pickerStyle(WheelPickerStyle()).frame(width: 350,height: 160).background(Color.black.opacity(0.35)).cornerRadius(7.0)
                    }
                    
                    
                    
                    Section(header: Text("Grade").frame(width:350,alignment: .leading).font(.system(size: 16)).foregroundColor(.gray)){
                        
                        Picker("",selection: $userdata.Grade){
                            ForEach(grades,id:\.self){
                                number in Text(String(number)).foregroundColor(.white)
                            }
                        }.pickerStyle(WheelPickerStyle()).frame(width: 350,height: 160).background(Color.black.opacity(0.35)).cornerRadius(7.0)
                        
                        
                    }
                
                Button(action: {
                    onSave()
                    dismiss()
                }, label: {
                    Text("DONE").frame(width:350,height: 50).background(Color("MyGray")).foregroundColor(.white).cornerRadius(7).padding()
                })
                
                
                
                    
                    
                    
                }
            }
        }
    }


#Preview {
    DataSheetView(userdata: .constant(userData()), onSave: {})
}
