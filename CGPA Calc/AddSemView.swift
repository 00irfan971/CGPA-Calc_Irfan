//
//  AddSemView.swift
//  CGPA Calc
//
//  Created by Irfan on 10/08/24.
//
import SwiftUI

struct AddSemView: View {
    @Binding var Sem:sem
    
    @State private var selectedIndex = 0
    
    @Environment(\.dismiss) private var dismiss
    
    var numbers=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
    
    var cred=(1...40)
    
    let onSave: () -> Void
    @FocusState var isInputActive: Bool
    
    
    var body: some View {
        ZStack{
            Color.black.opacity(0.92).ignoresSafeArea()
            
            VStack{
                
                Text("Add Semester").foregroundColor(.white).font(.system(size: 45,weight: .bold)).frame(width: 350,alignment: .leading).padding()
                
                Section(header: Text("Semester Number").frame(width:350,alignment: .leading).font(.system(size: 16)).foregroundColor(.gray))
                {
                    Picker("",selection: $Sem.name){
                        ForEach(numbers,id:\.self){
                            number in Text(String(number)).foregroundColor(.white)
                        }
                    }.pickerStyle(WheelPickerStyle()).frame(width: 350,height: 160).background(Color.black.opacity(0.35)).cornerRadius(7.0)
                    
                }.padding(.bottom)
                
                
                    
                    Section(header: Text("Enter SGPA").frame(width:350,alignment: .leading).font(.system(size: 16)).foregroundColor(.gray)){
                        
                        TextField("SGPA", text: $Sem.SCG).focused($isInputActive).toolbar {
                            ToolbarItemGroup(placement: .keyboard) {
                                Spacer()
                                
                                Button(action: {
                                    isInputActive = false
                                }
, label: {
                                    Text("Done").foregroundColor(.blue)
                                })}
                    }.foregroundColor(.white).frame(width: 350,height: 30).keyboardType(.decimalPad).background(Color("MyGray")).cornerRadius(5).foregroundColor(.white).padding(.bottom)                    }
                
                
                
                Section(header: Text("Total Credits").frame(width:350,alignment: .leading).font(.system(size: 16)).foregroundColor(.gray))
                {
                    Picker("",selection: $Sem.credits){
                        ForEach(cred,id:\.self){
                            cred in Text(String(cred)).foregroundColor(.white)
                        }
                    }.pickerStyle(WheelPickerStyle()).frame(width: 350,height: 160).background(Color.black.opacity(0.35)).cornerRadius(7.0)
                    
                }.padding(.bottom)
                
                    
                
                Button(action: {
                    onSave()
                    dismiss()
                }, label: {
                    Text("DONE").frame(width:350,height: 50).bold().background(Color("MyGray")).foregroundColor(.white).cornerRadius(7).padding()
                })
                
                
                
                    
                    
                    
                }
            }
        
        }
    }


#Preview {
    AddSemView(Sem: .constant(sem()), onSave: {})
}
