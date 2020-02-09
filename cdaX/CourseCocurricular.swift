//
//  CourseCocurricular.swift
//  cdaX
//
//  Created by Emilio Castro on 2/8/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import SwiftUI

struct CourseCocurricular: View {
    var token: String
    @State var alumno: String = ""
     @State var curso: String = ""
     @State var horario: String = ""
     @State var fechaInicio: String = ""
     @State private var showAlert = false
     var title = "Asignaciòn Cursos \n Co-curriculares"
      var image = "Illustration1"
      var body: some View {
        //  GeometryReader { geometry in
              ZStack {
                  Rectangle()
                      .fill(LinearGradient(gradient: Gradient(colors: [Color("gradient1"), Color("gradient2")]), startPoint: .top, endPoint: .bottom))
                  
                  VStack(alignment: .center) {
                      VStack(alignment: .center) {
                          Text(self.title)
                              .foregroundColor(Color("primary"))
                              .font(.title)
                              .fontWeight(.heavy)
                              .lineLimit(2)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                              .frame(height: 120)
                            
                        
                        /*  Text("10 sections")
                              .foregroundColor(Color("secondary"))
                              .padding(.top, 0)*/
                      }
                      .frame(width: 350)
                      
                 /*     Image(self.image)
                          .resizable()
                          .aspectRatio(contentMode: .fit)
                          .frame(width: geometry.size.width-60, height: 200)
                          .padding()*/
                    
                    VStack {
                        HStack {
                            Image(systemName: "person")
                           .frame(width: 16, height: 16)
                           .foregroundColor(Color("loginicon"))
                           .padding(.all)
                           .background(Color("background"))
                           .cornerRadius(16)
                                .padding(12)
                            
                          TextField("Seleccione Alumno", text: $alumno)
                              .frame(height: 72)
                           
                         
                        }
                        
                       
                       
                        
                        Divider()
                        HStack {
                            Image(systemName: "book.circle")
                                .frame(width: 16, height: 16)
                                .foregroundColor(Color("loginicon"))
                                .padding(.all)
                                .background(Color("background"))
                                .cornerRadius(16)
                                .padding(12)
                            TextField("Seleccione Curso", text: $curso)
                                .frame(height: 72)
                            
                        }
                        
                        Divider()
                        HStack {
                            Image(systemName: "clock")
                                .frame(width: 16, height: 16)
                                .foregroundColor(Color("loginicon"))
                                .padding(.all)
                                .background(Color("background"))
                                .cornerRadius(16)
                                .padding(12)
                            TextField("Seleccione Horario", text: $fechaInicio)
                                .frame(height: 72)
                            
                        }
                        
                        Divider()
                        HStack {
                            Image(systemName: "calendar")
                                .frame(width: 16, height: 16)
                                .foregroundColor(Color("loginicon"))
                                .padding(.all)
                                .background(Color("background"))
                                .cornerRadius(16)
                                .padding(12)
                            TextField("Seleccione Inicio del Curso", text: $horario)
                                .frame(height: 72)
                            
                        }
                        
                    } .background(Color.white)
                               .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                               .shadow(color: Color("buttonShadow2"), radius: 30, x: 0, y: 30)
                               .padding(.horizontal, 16)
                               .padding(.top, 30)
                               .opacity(1)
                               .offset(y: 0)
                               .animation(Animation.easeOut(duration: 0.6))
                    
                
                    
                   /* NavigationView {
                        List {
                            Text("Hello World")
                            Text("Hello World")
                            Text("Hello World")
                        }
                        .navigationBarTitle("Menu")
                    }*/
                      Spacer()
                  }
                  .padding(.top, 5)
                  .padding(.leading, 5)
                  
       //inicioç
                Spacer()
                HStack {
                              
                               
                               Button(action: {
                                   
                                   if (self.alumno.isEmpty || self.curso.isEmpty) {
                                     self.showAlert.toggle()
                                   }else {
                                      
                                       
                                       
                                   }//fin else isEmpty
                                   
                                   
                               }) {
                                   Text("Asignar").foregroundColor(.white)
                               }
                               .padding(.horizontal, 36)
                               .padding(.vertical, 12)
                               .background(Color("background7"))
                               .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                              /* .alert(isPresented: $showAlert, content: { //self.alert2
                                   
                                   email.isEmpty ? enviarAlerta(msg: "Debe ingresar su usuario") :
                                       password.isEmpty ?  enviarAlerta(msg: "Debe ingresar su password")  :
                                       enviarAlerta(msg: "Usuario o Password Invalido")
                                   
                               })
                                   .sheet(isPresented: $showHome ){
                                       Home(token: self.token, apellidos: self.apellidos)
                               }*/
                               /*.onTapGesture {
                                   if(self.email.isEmpty) {
                                   
                                       Alert(title: Text("Valida Datos"), message: Text("Debe ingresar su usuario"), dismissButton: .default(Text("Aceptar")))
                                       
                                      
                                            
                                   }
                               }*/
                           }
                           .padding(36)
                           .opacity(1)
                           .offset(y: 170)
                           .animation(Animation.easeOut(duration: 0.6))
                           
                           
                
                if (!self.alumno.isEmpty) {
                CourseCoCuInfo(text: "Codigo Alumno C2061 \nCarrera: 04 - Highschool \nGrado: 10TH - Tenth Grade \nSecciòn: C")
                    .background(Color.white)
                    .cornerRadius(30)
                    .frame(width: .infinity, height: 150)
                    .padding(.top, 650)
                
                }
                
                
                       }
                       .background(BlurView(style: .systemMaterial))
               //        .edgesIgnoringSafeArea(.all)
                  
    
                //fin
      
          
                
              
          }
   //   }
}

struct CourseCocurricular_Previews: PreviewProvider {
    static var previews: some View {
        CourseCocurricular(token: "")
    }
}

