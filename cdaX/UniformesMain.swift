//
//  UniformesMain.swift
//  cdaX
//
//  Created by Emilio Castro on 2/22/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

//
//  CourseCocurricular.swift
//  cdaX
//
//  Created by Emilio Castro on 2/8/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import SwiftUI

struct UniformesMain: View {
    var token: String
    @State var alumno: String = ""
     @State var famprod: String = ""
     @State private var showAlert = false
     @State private var showDatosAlumno = true
     @State var showCart = false
    @State var viewState = CGSize.zero
    var alumnos = ["Vianka Castro","Rasmus Castro","Emilio Castro"]
    var famprods = ["Uniformes"]
     var title = "Pedido de Uniformes"
    
   
      var body: some View {
         // GeometryReader { geometry in
               ZStack {
                 Rectangle()
                                    .fill(LinearGradient(gradient: Gradient(colors: [Color("gradient1"), Color("gradient1")]), startPoint: .top, endPoint: .bottom))
                
                //menu
                                  MenuR(showCart: $showCart, showpago: showCart)
                                  .blur(radius: showCart ? 6-viewState.height/30 : 0)
                                  .offset(y: -viewState.height/20)
                                  .animation(.default)
                                    .padding(.top, 25)
                                  //menu
                
                VStack(alignment: .center) { //VStack1
                  VStack(alignment: .center) {
                      Text(self.title)
                          .foregroundColor(Color("primary"))
                          .font(.title)
                          .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .padding(1.0)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        .frame(height: 150)
                        .padding(.top,5)
                         }
                      .frame(width: 350)
                        
                  
                    
                    VStack {
                       
                        HStack {
                            Image(systemName: "person")
                                .frame(width: 16, height: 16)
                                .foregroundColor(Color("loginicon"))
                                .padding(.all)
                                .background(Color("background"))
                                .cornerRadius(16)
                                .padding(12)
                            
                              TextField("Seleccione Alumno: ", text: $alumno)
                            .frame(height: 72)
                                 .disabled(true)
                                .contextMenu{
                                    VStack {
                                        ForEach(0 ..< self.alumnos.count) { index in
                                            Button(action: {self.alumno = self.alumnos[index] }) {
                                            HStack {
                                                Text(self.alumnos[index])
                                                Image(systemName: "person")
                                                
                                                
                                                
                                            }//HStck
                                        }//Button
                                        } //ForEach
                                       
                                }//VStack
                            }//contextMenu
                               
                            
                        }
                            Divider()
                        HStack {
                            Image(systemName: "list.dash")
                                .frame(width: 16, height: 16)
                                .foregroundColor(Color("loginicon"))
                                .padding(.all)
                                .background(Color("background"))
                                .cornerRadius(16)
                                .padding(12)
                            TextField("Familia de Productos", text: $famprod)
                                .frame(height: 72)
                            .disabled(true)
                            .contextMenu{
                                    VStack {
                                        ForEach(0 ..< self.famprods.count) { index in
                                            Button(action: {self.famprod = self.famprods[index] }) {
                                            HStack {
                                                Text(self.famprods[index])
                                                Image(systemName: "book.circle")
                                                
                                                
                                                
                                            }//HStck
                                        }//Button
                                        } //ForEach
                                       
                                }//VStack
                            }//contextMenu
                            
                        }
                    } .background(Color.white)
                               .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                               .shadow(color: Color("buttonShadow3"), radius: 30, x: 0, y: 30)
                               .padding(.horizontal, 16)
                               .padding(.top, 5)
                               .opacity(1)
                               .offset(y: 0)
                               .animation(Animation.easeOut(duration: 0.6))
                    
                    ScrollView {
                            UniformesRow1()
                            UniformesRow2()
                           }
                    
                      Spacer()
                  } //Vstack1
                  .padding(.top, 5)
                  .padding(.leading, 5)
                       } //ZStack
                       .background(BlurView(style: .systemMaterial))
                       .edgesIgnoringSafeArea(.all)
           
       
    
          } //View
   
}//MainView

struct UniformesMain_Previews: PreviewProvider {
    static var previews: some View {
        UniformesMain(token: "")
    }
}

struct MenuR : View {
    @Binding var showCart: Bool
    @State var showpago = false
    
    var body: some View {
        return VStack {
            HStack(spacing: 12) {
                Spacer()
                VStack { Image(systemName: "cart") }
                .frame(width: 44, height: 44)
                .background(Color("button"))
                .foregroundColor(.primary)
                .cornerRadius(22)
                .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
                .onTapGesture { self.showCart.toggle() }
                
                   
                Button(action: { self.showpago.toggle() }) {
                    VStack { Image(systemName: "creditcard") }
                        .foregroundColor(.primary)
                        .frame(width: 44, height: 44)
                        .background(Color("button"))
                        .cornerRadius(22)
                        .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
                        .sheet(isPresented: $showpago) {
                            UpdateList()
                    }
                }
            }
            .padding().offset(y: 70)
            
            Spacer()
        }
    }
}
