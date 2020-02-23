import SwiftUI

struct BaseView : View {

    @EnvironmentObject var viewRouter: ViewRouter

    var body: some View {
        
        VStack {
            if viewRouter.currentPage == "login" {
                Login(show: .constant(true))
            } else if viewRouter.currentPage == "home" {
              Home(token: "Sin Token", apellidos: "Sin Apellidos Home.swift", menu: menuData)
                   // .transition(.scale)
            }
        }
    }
}

#if DEBUG
struct MainView_Previews : PreviewProvider {
    static var previews: some View {
        BaseView().environmentObject(ViewRouter())
    }
}
#endif