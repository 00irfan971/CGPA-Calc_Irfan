//
//  CalcView.swift
//  CGPA Calc
//
//  Created by Irfan on 09/08/24.
//

import SwiftUI
import SwiftData

struct userData:Identifiable{
    var id = UUID()
    var Course:String=""
    var Grade:String="S"
    var credits:Int=1
    var CG:Double=0.00
    
}



struct CalcView: View {
    @State var cgpa:Float=0.00
    
    @State private var userdata=userData()
    
    @State private var showSheet:Bool = false
    
    @State private var CourseDataList: [userData]=[]
    
    
    
    
    var body: some View{
        
        ZStack{
            Color.black.opacity(0.92).ignoresSafeArea()
            
            VStack{
                

                Button(action: {showSheet.toggle()}, label: {
                    Image(systemName: "plus").foregroundColor(.white).font(.system(size: 35,weight:.bold))
                }).frame(width:350,alignment: .trailing)
                
                ZStack{
                    CircularProgressView(progress:Calc()).frame(width:250,height:250)
                    
                    VStack{
                        Text("CGPA").font(.system(size: 25,weight: .regular)).foregroundColor(.white)
                        
                        Text((CourseDataList.isEmpty ? "0.00" :String(Calc()))).foregroundColor(.white).font(.system(size: 70,weight: .bold))
                    }
                
                    
                    
                }
                
                
                
                ScrollView{
                    ForEach(CourseDataList) { user in
                        
                        ZStack{
                            Rectangle().frame(width:350,height: 70).cornerRadius(7).foregroundColor(Color("MyGray"))
                            
                            HStack{
                                Text("\(user.Grade)").foregroundColor(.white).frame(width:70,height: 75).background(Color.orange.opacity(0.7)).font(.system(size: 36)).cornerRadius(15).padding(.leading)
                                
                                VStack{
                                    Text("\(user.Course)").font(.system(size: 30,weight: .medium))
                                    Text("Credits: \(user.credits)").foregroundColor(.gray)
                                }
                                Spacer()
                                
                                Button(action: {deleteEntry(id: user.id)}, label: {
                                    Image(systemName: "trash").foregroundColor(.red)
                                }).frame(height: 50,alignment: .top).padding(.trailing,30)
                                
                            }
                        }
                    }
                }
                Spacer()
   
            }
            
            
        }.sheet(isPresented: $showSheet, content:{ DataSheetView(userdata: $userdata, onSave: addData)})
        
        
    }
    
    func deleteEntry(id: UUID) {
            if let index = CourseDataList.firstIndex(where: { $0.id == id }) {
            CourseDataList.remove(at: index)
            }
        }
    
    func addData(){
        
        CourseDataList.append(userdata)
        
        userdata=userData()
        
        
    }
    
    
    func Calc()->Double{
        var x:Double=0.00
        var z:Double=0.0
        var cg:Double=0.00
        var y=["S":10.0,"A":9.0,"B":8.0,"C":7.0,"D":6.0,"E":5.0]
        for course in CourseDataList{
            
            z=z+(Double(course.credits))
            
            
            x=x+(y[course.Grade] ?? 0.0)*Double(course.credits)
            
            cg=((x/z)*100).rounded()/100
            
            userdata.CG=cg
        }
        
        
        
        return cg;
    }
    
    
    struct CircularProgressView: View {
        
        var progress:Double=0.0
        var body: some View {
            ZStack {
                Circle()
                    .stroke(
                        Color.pink.opacity(0.35),
                        lineWidth: 30
                    )
                Circle()
                    .trim(from: 0, to: (progress/10)) // 1
                    .stroke(
                        Color.pink,style:StrokeStyle(lineWidth: 30, lineCap: .round
                    ))
                    .rotationEffect(.degrees(-90)).animation(.easeInOut(duration: 2), value: (progress/10))
                
            }
        }
    }
    
}

#Preview {
    CalcView()
}
