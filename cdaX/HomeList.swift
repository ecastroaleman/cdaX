//
//  HomeList.swift
//  cdaX
//
//  Created by Emilio Castro on 2/8/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//


import SwiftUI

struct HomeList : View {
    var token: String
    var courses = coursesData
    var apellidos: String
    @State var indice = 0
    @State var showCourseView = false
     @State var showUniformes = false
     @State var showCambiopass = false
     @State var showCafeteria = false
     @State var showCambioBus = false
     @State var showCourseCocu = false
    
    var body: some View {
        ScrollView {
            HStack {
                VStack(alignment: .leading) {
                    Text("Menu Principal").font(.largeTitle).fontWeight(.heavy)
                    Text(self.apellidos).foregroundColor(.gray)
                }
                Spacer()
                }
                .padding(.top, 138)
                .padding(.leading, 60)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                   
                    //Cursos Cocurriculares 0
                    GeometryReader { geometry in
                        Button(action: {self.showCourseCocu.toggle()})
                        {
                            CardView(course: self.courses[0])
                                .rotation3DEffect(Angle(degrees: Double(
                                    (geometry.frame(in: .global).minX - 30) / -30
                                )), axis: (x: 0, y: 10, z: 0))
                                .sheet(isPresented: self.$showCourseCocu) {
                                    CourseCocurricular(token: "", title: self.courses[0].title, image: self.courses[0].image)
                            }
                        }
                    }//Geometry
                    .frame(width: 246, height: 360)
                   
                    //Cambio de Bus 1
                    GeometryReader { geometry in
                                           Button(action: {self.showCambioBus.toggle()})
                                           {
                                               CardView(course: self.courses[1])
                                                   .rotation3DEffect(Angle(degrees: Double(
                                                       (geometry.frame(in: .global).minX - 30) / -30
                                                   )), axis: (x: 0, y: 10, z: 0))
                                                   .sheet(isPresented: self.$showCambioBus) {
                                                       CourseBusChange(token: "", title: self.courses[1].title, image: self.courses[1].image)
                                               }
                                           }
                                       }//Geometry
                                       .frame(width: 246, height: 360)
                    //Cafeteria 2
                    GeometryReader { geometry in
                                                              Button(action: {self.showCafeteria.toggle()})
                                                              {
                                                                  CardView(course: self.courses[2])
                                                                      .rotation3DEffect(Angle(degrees: Double(
                                                                          (geometry.frame(in: .global).minX - 30) / -30
                                                                      )), axis: (x: 0, y: 10, z: 0))
                                                                      .sheet(isPresented: self.$showCafeteria) {
                                                                          CourseCocurricular(token: "", title: self.courses[2].title, image: self.courses[2].image)
                                                                  }
                                                              }
                                                          }//Geometry
                                                          .frame(width: 246, height: 360)
                    //Cambio PAssword 3
                    GeometryReader { geometry in
                                                              Button(action: {self.showCambiopass.toggle()})
                                                              {
                                                                  CardView(course: self.courses[3])
                                                                      .rotation3DEffect(Angle(degrees: Double(
                                                                          (geometry.frame(in: .global).minX - 30) / -30
                                                                      )), axis: (x: 0, y: 10, z: 0))
                                                                      .sheet(isPresented: self.$showCambiopass) {
                                                                          CourseCocurricular(token: "", title: self.courses[3].title, image: self.courses[3].image)
                                                                  }
                                                              }
                                                          }//Geometry
                                                          .frame(width: 246, height: 360)
                    //Pedido  Uniformes 4
                    GeometryReader { geometry in
                                                              Button(action: {self.showUniformes.toggle()})
                                                              {
                                                                  CardView(course: self.courses[4])
                                                                      .rotation3DEffect(Angle(degrees: Double(
                                                                          (geometry.frame(in: .global).minX - 30) / -30
                                                                      )), axis: (x: 0, y: 10, z: 0))
                                                                      .sheet(isPresented: self.$showUniformes) {
                                                                          CourseCocurricular(token: "", title: self.courses[4].title, image: self.courses[4].image)
                                                                  }
                                                              }
                                                          }//Geometry
                                                          .frame(width: 246, height: 360)
                    
        //            ForEach(courses) { course in
      /*                  GeometryReader { geometry in
                            Button(action: {
                                self.indice = self.courses[course.index].index
                              
                                switch self.indice {
                                case 0:
                                    self.showCourseCocu.toggle()
                                case 1:
                                    self.showCambioBus.toggle()
                                case 2:
                                    self.showCafeteria.toggle()
                                case 3:
                                    self.showCambiopass.toggle()
                                default:
                                    self.showUniformes.toggle()
                                }
                                
                            }) {
                                
                                      CardView(course: course)
                                        .rotation3DEffect(Angle(degrees: Double(
                                            (geometry.frame(in: .global).minX - 30) / -30
                                        )), axis: (x: 0, y: 10, z: 0))
                                        .sheet(isPresented: self.$showCourseCocu) {
                                            CourseCocurricular(token: "", title: course.title, image: course.image)
                                    }
                                    
                                
                                
                            }
                        }
                        .frame(width: 246, height: 360)
                        */
                 //   } //for
                }.padding(30)
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width, height: 480)
            
            CertificateRow()
            
            CourseRow()
            
            Spacer()
        }
    }
}

#if DEBUG
struct HomeBack_Previews : PreviewProvider {
    static var previews: some View {
        HomeList(token: "", apellidos: "Sin apellidos")
    }
}
#endif

struct Course : Identifiable {
    var id = UUID()
    var index: Int
    var title: String
    var image: String
    var color: Color
    var shadowColor: Color
}

let coursesData = [
    Course(index: 0, title: "Asignación Cursos Cocurriculares",
           image: "CL",
           color: Color(hue: 0.677, saturation: 0.701, brightness: 0.788),
           shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
    Course(index: 1, title: "Solicitar Cambio            de Bus",
           image: "bus",
           color: Color(red: 0.9254901960784314, green: 0.49411764705882355, blue: 0.4823529411764706),
           shadowColor: Color(red: 0.9254901960784314, green: 0.49411764705882355, blue: 0.4823529411764706, opacity: 0.5)),
    Course(index: 2, title: "Cafeteria",
           image: "cafeteria",
           color: Color("background7"),
           shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
    Course(index: 3, title: "Cambio de        Contraseña",
           image: "Illustration4",
           color: Color("background8"),
           shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
    Course(index: 4, title: "Pedido Uniformes",
           image: "uniformes",
           color: Color("background9"),
           shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
]

struct CardView : View {
    var course = Course(index: -1, title: "", image: "Illustration1", color: Color.white, shadowColor: Color.black)
    
    var body: some View {
        return VStack(alignment: .leading) {
            Text(course.title)
                .foregroundColor(.white)
                .font(.headline)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .lineSpacing(6)
                .lineLimit(4)
                .padding(30)
            Spacer()
            Image(course.image)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 246, height: 150)
                .padding(.bottom, 30)
        }
        .background(course.color)
            .cornerRadius(30)
            .frame(width: 246, height: 360)
            .shadow(color: course.shadowColor, radius: 20, x: 0, y: 20)
    }
}
