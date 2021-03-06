//
//  Login.swift
//  cdaX
//
//  Created by Emilio Castro on 2/4/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

//
//  Login.swift
//  SwiftUI-DesignCode
//
//  Created by Meng To on 7/26/19.
//  Copyright © 2019 Meng To. All rights reserved.
//

import SwiftUI
let screen2 = UIScreen.main.bounds
var isScreenTall2 = screen2.height > 736 ? true : false
  

struct Login: View {
    @State var email: String = ""
    @State var password: String = ""
    @Binding var show: Bool
    @State private var showAlert = false
     let networkingService = NetworkingService()
    //   var token = ""
   @State private var esMaestro = 0
    func enviarAlerta(msg: String) -> Alert {
                  var alert2: Alert {
                            Alert(title: Text("CDA"), message: Text(msg), dismissButton: .default(Text("Aceptar")))
                        }
        return alert2
              } //fin func
    var body: some View {
        VStack(spacing: 0) {
            
            VStack(spacing: 20) {
                Image("LOGO3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: isScreenTall ? 206 : 100)
                    .opacity(show ? 1 : 0)
                    .offset(y: show ? 0 : 20)
                    .animation(Animation.easeOut(duration: 0.6).delay(0.1))
                Text("Colegio Decroly Americano")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .lineLimit(2)
                    .frame(height: 90)
                    .multilineTextAlignment(.center)
                    .opacity(show ? 1 : 0)
                    .offset(y: show ? 0 : 20)
                    .animation(Animation.easeOut(duration: 0.6).delay(0.3))
                Text("Guatemala, C.A.")
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .lineSpacing(10)
                    .frame(height: 60)
                    .opacity(show ? 1 : 0)
                    .offset(y: show ? 0 : 20)
                    .animation(Animation.easeOut(duration: 0.6).delay(0.5))
             //   Button(action: { self.show.toggle() }) {
               //     Text("Skip").foregroundColor(.white)
                //    .opacity(show ? 1 : 0)
                 //   .offset(y: show ? 0 : 20)
                  //  .animation(Animation.easeOut(duration: 0.6).delay(0.6))
               // }
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.horizontal, 20)
            .padding(.vertical, isScreenTall ? 60 : 28)
            .background(Color("background6"))
            .animation(Animation.spring())
            .clipShape(
                RoundedRectangle(
                    cornerRadius: show && isScreenTall ? 30 : 0,
                    style: .continuous
                )
                .size(CGSize(
                    width: screen.width,
                    height: show ? 600 : 0)
                )
            )
            
            VStack(spacing: 0) {
                HStack() {
                                   Image(systemName: "faceid")
                                       .frame(width: 16, height: 16)
                                       .foregroundColor(Color("loginicon"))
                                       .padding(.all)
                                       .background(Color("background"))
                                       .cornerRadius(16)
                                       .padding(12)
                    
                                Picker(selection: $esMaestro, label: Text("Tipo de Autenticaciòn: ")) {
                                                  Text("Maestro").tag(0)
                                                  Text("Alumno").tag(1)
                                }.padding(.horizontal, 10)
                                    .pickerStyle(SegmentedPickerStyle())

                               }
                               Divider()
                HStack {
                    Image(systemName: "person.crop.circle.fill")
                        .frame(width: 16, height: 16)
                        .foregroundColor(Color("loginicon"))
                        .padding(.all)
                        .background(Color("background"))
                        .cornerRadius(16)
                        .padding(12)
                    TextField("Your email", text: $email)
                        .frame(height: 72)
                }
                Divider()
                HStack {
                    Image(systemName: "lock.fill")
                        .frame(width: 16, height: 16)
                        .foregroundColor(Color("loginicon"))
                        .padding(.all)
                        .background(Color("background"))
                        .cornerRadius(16)
                        .padding(12)
                    SecureField("Password", text: $password)
                        .frame(height: 72)
                    
                }
            }
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: Color("buttonShadow2"), radius: 30, x: 0, y: 30)
            .padding(.horizontal, 16)
            .padding(.top, 30)
            .opacity(show ? 1 : 0)
            .offset(y: show ? 0 : 20)
            .animation(Animation.easeOut(duration: 0.6))
            
            HStack {
                if (self.esMaestro == 0) {
                Text("Olvidò su contraseña ?")
                    .font(.subheadline)
                    .underline()
                    .padding(.leading, 12)
                }
                Spacer()
                
                Button(action: {
                    
                    if (self.email.isEmpty || self.password.isEmpty) {
                      self.showAlert.toggle()
                    }else {
                        let parameters = ["username": self.email, "password": self.password,"grant_type":"password"]
                        
                        self.networkingService.request(endpoint: "token", parameters: parameters as [String : Any]) {  (result) in
                                       switch result {
                                           
                                       case .success(let user):
                                        var token = user.access_token
                                         /*  self.performSegue(withIdentifier: "menuPrincipal", sender: user)*/
                                        print("Login exitoso -> \(token)")
                                       case .failure(let error):
                                          // var retorno = ""
                                           if (error.localizedDescription == "invalid_grant"){
                                              
                                           } //else {retorno = error.localizedDescription}
                                       
                                          // self.muestraAlerta(msg: "Alerta")
                                          
                                           self.showAlert.toggle()
                                           return
                                       }
                                       
                                   }//fin networking
                        
                    }//fin else isEmpty
                    
                    
                }) {
                    Text("Log in").foregroundColor(.white)
                }
                .padding(.horizontal, 36)
                .padding(.vertical, 12)
                .background(Color("background3"))
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .alert(isPresented: $showAlert, content: { //self.alert2
                    
                    email.isEmpty ? enviarAlerta(msg: "Debe ingresar su usuario") :
                        password.isEmpty ?  enviarAlerta(msg: "Debe ingresar su password")  :
                        enviarAlerta(msg: "Usuario o Password Invalido")
                    
                })
                /*.onTapGesture {
                    if(self.email.isEmpty) {
                    
                        Alert(title: Text("Valida Datos"), message: Text("Debe ingresar su usuario"), dismissButton: .default(Text("Aceptar")))
                        
                       
                             
                    }
                }*/
            }
            .padding(16)
            .opacity(show ? 1 : 0)
            .offset(y: show ? 0 : 20)
            .animation(Animation.easeOut(duration: 0.6))
            
            Spacer()
        }
        .background(BlurView(style: .systemMaterial))
//        .edgesIgnoringSafeArea(.all)
        
       
        
    }
   
}

#if DEBUG
struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login(show: .constant(true))
    }
}
#endif



