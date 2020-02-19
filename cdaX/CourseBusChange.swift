//
//  CourseCocurricular.swift
//  cdaX
//
//  Created by Emilio Castro on 2/8/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import SwiftUI

struct CourseBusChange: View {
    var token: String
    @State var alumno: String = ""
     @State var curso: String = ""
     @State var horario: String = ""
     @State var fechaInicio = Date()
      @State var fechaInicio2 = ""
    @State var showPickerView = false
     @State private var showAlert = false
     @State private var showDatosAlumno = true
    @State private var alumnoIndex = 0
    
      @State var Infalumno: String = ""
      @State private var bajaSolo = 0
    
    var alumnos = ["Vianka Castro","Rasmus Castro","Emilio Castro"]
     var cursos = ["Matematica","Artes Plasticas","Guitarra"]
    var horarios = ["Lunes y Miercoles 10:30","Martes y Jueves 11:30","Viernes 12:30"]
     var title = "Solicitud de \nCambio de Bus"
      var image = "Illustration1"
    
    private var dateProxy:Binding<Date> {
           Binding<Date>(get: {self.fechaInicio }, set: {
               self.fechaInicio = $0
            let formatter = DateFormatter()
               formatter.dateFormat = "dd-MM-yyyy"
            self.fechaInicio2 = formatter.string(from: $0)
            self.showPickerView = false
           })
       }
      var body: some View {
         // GeometryReader { geometry in
                ZStack {
                
                 Rectangle()
                                    .fill(LinearGradient(gradient: Gradient(colors: [Color("gradient1"), Color("gradient2")]), startPoint: .top, endPoint: .bottom))
                
                
                  
                  VStack(alignment: .center) {
                  VStack(alignment: .center) {
                      Text(self.title)
                          .foregroundColor(Color("primary"))
                          .font(.title)
                          .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .padding(1.0)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                          .frame(height: 120)
                     
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
                                .padding(5)
                                
                            
                            
                            TextField("Seleccione Alumno: ", text: $alumno)
                            .frame(height: 50)
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
                            }//Contextmenu
                            .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                            
                            //contextMenu
                               
                            
                        }
                        
                        HStack {
                                                  TextField("Info del Alumno", text: $Infalumno)
                                                      .padding(.horizontal, 0.0)
                                                      .frame(height: 50)
                                                      .disabled(true)
                                                    .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                                                      .foregroundColor(.white)
                                                      .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                                                    .lineLimit(4)
                                                  
                                                  
                                                  
                                                  
                            }//HStack
                        
                        Divider()
                        
                        HStack {
                            Image(systemName: "calendar")
                                .frame(width: 16, height: 16)
                                .foregroundColor(Color("loginicon"))
                                .padding(.all)
                                .background(Color("background"))
                                .cornerRadius(16)
                                .padding(5)
                            
                            TextField("Seleccione Fecha de Cambio de Ruta", text: $fechaInicio2)
                                .frame(height: 50)
                                .disabled(true)
                                .onTapGesture {
                                    self.showPickerView =  true
                            }
                          
                            if (self.showPickerView) {
                                DatePicker(selection: dateProxy, displayedComponents: .date ,  label: { Text("Seleccione") })
                                
                            }
                        
                            
                        }//HStack
                        
                        HStack {
                                               TextField("Info del Alumno", text: $Infalumno)
                                               .padding(.horizontal, 0.0)
                                               .frame(height: 50)
                                               .disabled(true)
                                             .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                                               .foregroundColor(.white)
                                               .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                                               .lineLimit(4)
                                                
                                               }//HStack
                        
                        Divider()
                        HStack {
                        Image(systemName: "car")
                        .frame(width: 16, height: 16)
                        .foregroundColor(Color("loginicon"))
                        .padding(.all)
                        .background(Color("background"))
                        .cornerRadius(16)
                        .padding(5)
                        
                        TextField("Seleccione Parada de Regreso", text: $fechaInicio2)
                        .frame(height: 50)
                        .disabled(true)
                        .onTapGesture {
                        self.showPickerView =  true
                        }
                        
                        //  Form {
                        //  Section ()  {
                        if (self.showPickerView) {
                        DatePicker(selection: dateProxy, displayedComponents: .date ,  label: { Text("Seleccione") })
                        
                        }
                        // }//Section
                        // }//form
                        
                        
                        }//HStack
                        Divider()
                                                
                                                HStack {
                                                Image(systemName: "car")
                                                .frame(width: 16, height: 16)
                                                .foregroundColor(Color("loginicon"))
                                                .padding(.all)
                                                .background(Color("background"))
                                                .cornerRadius(16)
                                                .padding(5)
                                                
                                                Picker(selection: $bajaSolo, label: Text("Puede Bajar Solo: ")) {
                                                Text("SI").tag(1)
                                                Text("NO").tag(0)
                                                }.padding(.horizontal, 10)
                                                .pickerStyle(SegmentedPickerStyle())
                                                
                                                
                                                }//HStack
                        
                       
                        
                    } .background(Color.white)
                               .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                               .shadow(color: Color("buttonShadow2"), radius: 30, x: 0, y: 30)
                               .padding(.horizontal, 16)
                               .padding(.top, 30)
                               .opacity(1)
                               .offset(y: 0)
                               .animation(Animation.easeOut(duration: 0.6))
                    
                
                      Spacer()
                  }
                  .padding(.top, 5)
                  .padding(.leading, 5)
                  
       //inicioç
                Spacer()
               
                    /*
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
                                               .offset(y: showPickerView ? 280 : 170)
                                               .animation(Animation.easeOut(duration: 0.6))
                                               
                     */
                   
                       }
                       .background(BlurView(style: .systemMaterial))
               //        .edgesIgnoringSafeArea(.all)
                
              
          }
}

struct CourseBusChange_Previews: PreviewProvider {
    static var previews: some View {
        CourseBusChange(token: "")
    }
}


