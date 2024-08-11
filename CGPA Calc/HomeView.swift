//
//  HomeView.swift
//  CGPA Calc
//
//  Created by Irfan on 09/08/24.
//

import SwiftUI

struct sem:Identifiable{
    var id = UUID()
    var name:Int=1
    var SCG:String=""
    var credits:Int=1
    
}

struct HomeView: View {
    
    @State private var Sem = sem()
    
    @State private var ShowSheet:Bool=false
    
    @Binding var userData:userData
    
    @State private var semList:[sem]=[]
    
    let colums=[
        GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    
    
    var body: some View {
        
        ZStack{
            
            Color.black.opacity(0.92).ignoresSafeArea()
            VStack{
                
                //Text("Lend").font(.system(size: 50)).bold().frame(width: 340,alignment: .leading).padding(20)
                
                ZStack{
                    RoundedRectangle(cornerRadius: 20).fill(Color.black).strokeBorder(.black).frame(width:350,height:140).shadow(color:.black, radius: 10)
                    VStack{
                        Text("CGPA :-").frame(width:300,alignment:.leading).font(.system(size: 40,weight: .bold,design: .rounded)).foregroundColor(Color.white).padding(2)
                        
                        
                        
                        Text("\((semList.isEmpty ? "0.00" :String(calc())))").frame(width:280,alignment:.leading).font(.system(size: 40,weight: .bold
                                                                                              )).foregroundColor(.green)
                        
                    }
                    
                }.padding()
                
                Button(action: {ShowSheet.toggle()}, label: {
                    Text("Add Semester").frame(width: 340,height: 30).background(Color.gray).cornerRadius(7).foregroundColor(.black
                    ).shadow(color:.black,radius: 7)
                }).padding()
                
                
                ScrollView{
                    LazyVGrid(columns: colums, spacing:10){
                        
                        ForEach(semList){ semes in
                            ZStack{
                                Rectangle().frame(width:110,height:100).cornerRadius(10).foregroundColor(.black.opacity(0.3)).shadow(color:.black, radius: 9)
                                VStack{
                                    HStack{
                                        Text("\(semes.SCG)").frame(width:40,height:40).background(Color.cyan.opacity(0.9)).cornerRadius(25).padding(.trailing).fontWeight(.bold)
                        
                                        
                                        Button(action: {deleteEntry(id: semes.id)}, label: {
                                            Image(systemName: "trash").foregroundColor(.red)
                                        }).frame(height: 50,alignment: .top).padding(.leading,5)
                                        
                                        
                                    }
                                    
                                    Text("Sem:  \(semes.name)").foregroundColor(.white).font(.system(size: 17,weight: .bold))
                                }
                            }
                        }
                    }
                }.frame(width:350)
                
                
                Spacer()
                
            }
        }.sheet(isPresented: $ShowSheet,content:{ AddSemView(Sem: $Sem, onSave: AddData)})
        
        
    }
    
    func AddData(){
        
        semList.append(Sem)
        
        Sem=sem()
        
        
    }
    
    func deleteEntry(id: UUID) {
            if let index = semList.firstIndex(where: { $0.id == id }) {
            semList.remove(at: index)
            }
        }
    
    func calc()->Double{
        var x:Double=0.00
        
        var z:Double=0.00
        
        var y:Double=0.00
        
        for sem in semList{
            y=y+Double(sem.credits)
            
            x=x+(Double(sem.SCG) ?? 0.0)*Double(sem.credits)
            
            
        }
        z=((x/y)*100).rounded()/100
        return z
    }
}

#Preview {
    HomeView(userData: .constant(userData()))
}
