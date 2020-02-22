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
    @State var ruta: String = ""
    @State var parada: String = ""
    @State var recibe: String = ""
    @State var viajacon: String = ""
    @State var fechaInicio = Date()
    @State var fechaInicio2 = ""
    @State var showPickerView = false
    @State private var showAlert = false
    @State private var showDatosAlumno = true
    @State private var alumnoIndex = 0
    
    @State var Infalumno: String = ""
    @State private var bajaSolo = 0
    
    var alumnos = ["Vianka Castro","Rasmus Castro","Emilio Castro"]
    var rutas = ["Ruta1","Ruta2","Ruta3","Ruta4"]
    var paradas = ["Parada1","Paradaa2","Parada3","Parada4"]
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
         GeometryReader { geometry in
        
    
         ZStack{
         
         Rectangle()
         .fill(LinearGradient(gradient: Gradient(colors: [Color("gradient1"), Color("gradient2")]), startPoint: .top, endPoint: .bottom))
         
         
         
         VStack {
         VStack {
            
            Text(self.title)
         .foregroundColor(Color("primary"))
         .font(.title)
         .fontWeight(.heavy)
         .multilineTextAlignment(.center)
         .lineLimit(2)
         .padding(1.0)
         .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
         .frame(height: 70)
         
         }
         .frame(width: 350)
         
         /*     Image(self.image)
         .resizable()
         .aspectRatio(contentMode: .fit)
         .frame(width: geometry.size.width-60, height: 200)
         .padding()*/
         
         VStack {
         
         HStack {
           Icono(type: "person", color: "loginicon")
            Textos(ptitulo: "Seleccione Alumno:", palumno: self.alumno, countAlumnos: self.alumnos.count, palumnos: self.alumnos, picono: "person")
         }.padding(.top,10)
         
         HStack {
            ShowInfo(contenido: "El detalle de la info", pinfoalumno: self.Infalumno)
         }//HStack
         
         
         HStack {
         Icono(type: "calendar", color: "loginicon")
         
            TextField("Seleccione Fecha de Cambio de Ruta", text: self.$fechaInicio2)
         .frame(height: 50)
         .disabled(true)
         .onTapGesture {
         self.showPickerView =  true
         }
         
         if (self.showPickerView) {
            DatePicker(selection: self.dateProxy, displayedComponents: .date ,  label: { Text("Seleccione") })
         
         }
         
         
         }//HStack
         
         HStack {
            ShowInfo(contenido: "El detalle de la info", pinfoalumno: self.Infalumno)
        }//HStack
         
         HStack {
         Icono(type: "car", color: "loginicon")
            Textos(ptitulo: "Seleccione Ruta de Bus de Regreso:", palumno: self.ruta, countAlumnos: self.rutas.count, palumnos: self.rutas, picono: "car")
         }//HStack
         
         HStack {
         Icono(type: "nosign", color: "loginicon")
            Textos(ptitulo: "Seleccione Parada de Bus de Regreso:", palumno: self.parada, countAlumnos: self.paradas.count, palumnos: self.paradas, picono: "nosign")
         }//HStack
         
         
         HStack {
         Icono(type: "car", color: "loginicon")
         
         VStack {
         Text("Puede Bajar Solo ? ")
         .font(.footnote)
         .fontWeight(.thin)
         .frame(height: 11)
         .foregroundColor(Color(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)))
         .multilineTextAlignment(.center)
         
            Picker(selection: self.$bajaSolo, label: Text("Puede Bajar Solo: ")) {
                Text("SI").tag(1)
                Text("NO").tag(0)
         }.padding(.horizontal, 10)
         .pickerStyle(SegmentedPickerStyle())
                .foregroundColor(.red)
              //  .background(self.bajaSolo == 1 ? Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)) : Color(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)))
            
         
         }
         }
            
            HStack {
                    Icono(type: "person", color: "loginicon")
                    VStack {
            
                    TextField("Quien recibe en parada:", text: self.$recibe)
                        
                    }
                }//Hstack
  
            HStack {
                Icono(type: "person", color: "loginicon")
                VStack {
        
                TextField("Viajarà en carro con:", text: self.$viajacon)
                   
                }
            }//Hstack
                .padding(.bottom, 10)
         
         
         } .background(Color.white)
         .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
         .shadow(color: Color("buttonShadow2"), radius: 30, x: 0, y: 30)
         .padding(.horizontal, 10)
         .padding(.top, 2)
         .opacity(1)
         .offset(y: CGFloat(0))
         .animation(Animation.easeOut(duration: 0.6))
         
         
         
         }
         .padding(.top, 5)
         .padding(.leading, 5)
         
       HStack {
                         Button(action: {
                         
                         if (self.alumno.isEmpty ) {
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
                        
                         }
                         .padding(36)
                         .opacity(1)
                 .offset(y: self.showPickerView ? 490 : 380)
                         .animation(Animation.easeOut(duration: 0.6))
                         
         
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
    
    
}

struct CourseBusChange_Previews: PreviewProvider {
    static var previews: some View {
        CourseBusChange(token: "")
        
    }
}



struct Icono: View {
    var type: String
    var color: String
    var body: some View {
        Image(systemName: type)
            .frame(width: 16, height: 16)
            .foregroundColor(Color(color))
            .padding(.all)
            .background(Color("background"))
            .cornerRadius(16)
            .padding(5)
    }
}

struct Textos: View {
    var ptitulo: String
    @State var palumno: String
    var countAlumnos: Int
    var palumnos: [String]
    var picono: String
    var body: some View {
        TextField(ptitulo, text: $palumno)
            .frame(height: 50)
            .disabled(true)
            .contextMenu{
                VStack {
                    ForEach(0 ..< countAlumnos) { index in
                       
                        Button(action: {self.palumno = self.palumnos[index] }) {
                            HStack {
                                
                                Text(self.palumnos[index])
                                Image(systemName: self.picono)
                                
                            }//HStck
                        }//Button
                        
                    } //ForEach
                    
                }//VStack
        }//Contextmenu
            .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
    }
}

struct ShowInfo: View {
    var contenido: String
    @State var pinfoalumno: String
    var body: some View {
        TextField(contenido, text: $pinfoalumno)
            .padding(.horizontal, 0.0)
            .frame(height: 50)
            .disabled(true)
            .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
            .foregroundColor(.white)
            .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
            .lineLimit(4)
    }
}
