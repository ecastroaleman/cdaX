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
    
    var types = ["Pantalones","Sudaderos","Chalecos","Camisas"]
    @State var selected = "Pantalones"
    var body: some View {
        // GeometryReader { geometry in
        NavigationView {
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
                 //   .padding(.horizontal, 16)
                    .padding(.top, 5)
                    .opacity(1)
                    .offset(y: 0)
                    .animation(Animation.easeOut(duration: 0.6))
                
                /*       ScrollView {
                 UniformesRow1()
                 UniformesRow2()
                 }*/
             VStack(spacing: 10){
                HStack{
                    ForEach(types,id: \.self){ i in
                        HStack{
                            Button(action: {
                                self.selected = i
                                print("Seleccionado -> \(self.selected)")
                            }) {
                                Text(i).padding()
                                    .font(.system(size: 12))
                                
                            }
                            .foregroundColor(self.selected == i ? .white : .black)
                            .background(self.selected == i ? Color.black : Color.clear)
                            .cornerRadius(10)
                        
                            Spacer(minLength: 0)
                        }
                    }
                }
               
                  DetailsScroll2()
                
                }//.padding()
                       .background(Color("Color"))
                       .animation(.spring())
                
              
                
                
                Spacer()
            } //Vstack1
              //  .padding(.top, 5)
                .padding(.leading, 5)
        } //ZStack
            .background(BlurView(style: .systemMaterial))
            .edgesIgnoringSafeArea(.all)
        
        }//NavView
        
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


struct DetailsScroll1 : View {
    
    @State var show = false
    
    var body : some View{
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 12){
                
                ForEach(datas){i in
                    
                    HStack{
                        
                        ForEach(i.rows){j in
                            
                            Cards(row: j)
                        }
                    }
                }
            }
        }
    }
}


struct DetailsScroll2 : View {
    
    @State var show = false
    
    var body : some View{
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 12){
                
                ForEach(datas){i in
                    
                    HStack{
                        
                        ForEach(i.rows){j in
                            
                            Cards2(row: j)
                        }
                    }
                }
            }
        }
    }
}

struct Cards2 : View {
    
    var row : row
    @State var show  = false
    
    
    var body : some View{
        
        VStack(spacing: 8){
            
            NavigationLink(destination: DetailView2(show: $show), isActive: $show) {
                
                Image(row.image).renderingMode(.original).resizable().frame(width: UIScreen.main.bounds.width / 2 - 25, height: 240)
            }
            
           
            
            HStack{
                
                VStack(alignment: .leading, spacing: 10){
                    
                    Text(row.name)
                    Text(row.price).fontWeight(.heavy)
                    
                }
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Image("option").renderingMode(.original)
                    
                }.padding(.trailing, 15)
            }
        }
    }
}

struct DetailView2 : View {
    
    @Binding var show : Bool
    @State var size = ""
    
    var body : some View{
        
        VStack(spacing : 0){
            
            HStack(spacing: 18){
                
                Button(action: {
                    
                    self.show.toggle()
                    
                }) {
                    
                    Image("Back").renderingMode(.original)
                }
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Image("search").renderingMode(.original)
                }
                
                Button(action: {
                    
                }) {
                    
                    Image("shop").renderingMode(.original)
                }

            }.navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .padding(15)
                
            
            Image("pic").resizable()
            
            VStack(alignment: .leading ,spacing: 15){
                
                HStack{
                    
                    VStack(alignment: .leading, spacing: 8){
                        
                        Text("Summer Vibes").font(.largeTitle)
                        Text("$199.99").fontWeight(.heavy)
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 10){
                        
                        Circle().fill(Color.green).frame(width: 20, height: 20)
                        Circle().fill(Color.blue).frame(width: 20, height: 20)
                        Circle().fill(Color.red).frame(width: 20, height: 20)
                    }
                }

                
                Text("Fitted top made from a polyamide blend. Features wide straps and chest reinforcement.")
                
                
                
                Text("Select Size")
                
                HStack{
                    
                    ForEach(sizes,id: \.self){i in
                        
                        Button(action: {
                            
                            self.size = i
                            
                        }) {
                            
                            Text(i).padding().border(Color.black, width: self.size == i ? 1.5 : 0)
                            
                        }.foregroundColor(.black)
                    }
                }

                
                HStack{
                    
                    Button(action: {
                        
                    }) {
                        
                        Text("Add To Cart").padding().border(Color.black, width: 1.4)
                        
                    }.foregroundColor(.black)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        
                        Text("Buy Now").padding()
                        
                    }.foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(10)
                    
                }.padding([.leading,.trailing], 15)
                .padding(.top, 15)
                
            }.padding()
            .background(rounded().fill(Color.white))
            .padding(.top, -50)
            
        }
    }
}

struct rounded2 : Shape {
    
    func path(in rect: CGRect) -> Path {
    
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 35, height: 35))
        
        return Path(path.cgPath)
    }
}

struct type2 : Identifiable{
    
    var id : Int
    var rows : [row]
}

struct row2 : Identifiable {
    
    var id : Int
    var name : String
    var price : String
    var image : String
   
}

var tallas = ["S","M","X","XL"]

var datosuni = [
    

    type2(id: 0,rows: [row(id:0,name: "Fit And Flare", price: "$199", image: "p11"),row(id:1,name: "Empire Dress", price: "$136", image: "p12")]),

    type2(id: 2,rows: [row(id:0,name: "Summer Vibes", price: "$136", image: "p21"),row(id:1,name: "Flora Fun", price: "$150", image: "p22")]),

]

