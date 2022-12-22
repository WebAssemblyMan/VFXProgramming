//
//  Copyright © 2022 James Boo. All rights reserved.
//

import SwiftUI

struct PhotoMainViewX: View {
    
    @EnvironmentObject var pageSettings: PageSettings
    
    var body: some View {
        Image(uiImage: pageSettings.filteredBackgroundImage!)
            .resizable()
            .edgesIgnoringSafeArea(.all)
            .scaledToFit()
            .onAppear(perform: initPage)
    }
    
    //Digital Compositing on Mobile
    //https://github.com/Misfits-Rebels-Outcasts/Nodef

    func initPage() {

        pageSettings.applyPhoto(uiImage: pageSettings.backgroundImage!, dpi:1000)
        
        let filters = FiltersX()
     
        let filterHolder = filters.getFilterWithHolder("Color Matrix")
        let colorMatrix = filterHolder.filter as! ColorMatrixFX
        //Identity Matrix
        /*
        colorMatrix.rx=1.0
        colorMatrix.ry=0.0
        colorMatrix.rz=0.0
        colorMatrix.rw=0.0

        colorMatrix.gx=0.0
        colorMatrix.gy=1.0
        colorMatrix.gz=0.0
        colorMatrix.gw=0.0

        colorMatrix.bx=0.0
        colorMatrix.by=0.0
        colorMatrix.bz=1.0
        colorMatrix.bw=0.0

        colorMatrix.ax=0.0
        colorMatrix.ay=0.0
        colorMatrix.az=0.0
        colorMatrix.aw=1.0
         */
        
        //Extract Red Channel as Grayscale
        
         colorMatrix.rx=1.0
         colorMatrix.ry=0.0
         colorMatrix.rz=0.0
         colorMatrix.rw=0.0

         colorMatrix.gx=1.0
         colorMatrix.gy=0.0
         colorMatrix.gz=0.0
         colorMatrix.gw=0.0

         colorMatrix.bx=1.0
         colorMatrix.by=0.0
         colorMatrix.bz=0.0
         colorMatrix.bw=0.0

         colorMatrix.ax=0.0
         colorMatrix.ay=0.0
         colorMatrix.az=0.0
         colorMatrix.aw=1.0
        

        //Extract Red Channel and show it as it is
        /*
         colorMatrix.rx=1.0
         colorMatrix.ry=0.0
         colorMatrix.rz=0.0
         colorMatrix.rw=0.0

         colorMatrix.gx=0.0
         colorMatrix.gy=0.0
         colorMatrix.gz=0.0
         colorMatrix.gw=0.0

         colorMatrix.bx=0.0
         colorMatrix.by=0.0
         colorMatrix.bz=0.0
         colorMatrix.bw=0.0

         colorMatrix.ax=0.0
         colorMatrix.ay=0.0
         colorMatrix.az=0.0
         colorMatrix.aw=1.0
        */
        
        //Extract Green Channel as Grayscale
        /*
         colorMatrix.rx=0.0
         colorMatrix.ry=1.0
         colorMatrix.rz=0.0
         colorMatrix.rw=0.0

         colorMatrix.gx=0.0
         colorMatrix.gy=1.0
         colorMatrix.gz=0.0
         colorMatrix.gw=0.0

         colorMatrix.bx=0.0
         colorMatrix.by=1.0
         colorMatrix.bz=0.0
         colorMatrix.bw=0.0

         colorMatrix.ax=0.0
         colorMatrix.ay=0.0
         colorMatrix.az=0.0
         colorMatrix.aw=1.0
         */

        //Extract Blue Channel as Grayscale
        /*
         colorMatrix.rx=0.0
         colorMatrix.ry=0.0
         colorMatrix.rz=1.0
         colorMatrix.rw=0.0

         colorMatrix.gx=0.0
         colorMatrix.gy=0.0
         colorMatrix.gz=1.0
         colorMatrix.gw=0.0

         colorMatrix.bx=0.0
         colorMatrix.by=0.0
         colorMatrix.bz=1.0
         colorMatrix.bw=0.0

         colorMatrix.ax=0.0
         colorMatrix.ay=0.0
         colorMatrix.az=0.0
         colorMatrix.aw=1.0
         */
        
        filters.add(filterHolder: filterHolder)
        pageSettings.filteredBackgroundImage=filters.applyFilters(image: pageSettings.backgroundImage!)
                         
    }
    

    

    
}
