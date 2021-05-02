//
//  locationmath.m
//  AVCam
//
//  Created by ken tee on 26/4/21.
//  Copyright © 2021 Apple. All rights reserved.
//

#import "locationmath.h"

@implementation locationmath
 


#define degreesToRadians(x) (M_PI * x / 180.0)
#define radiansToDegrees(x) (x * 180.0 / M_PI)
 

 /*
  
 

- (float)getHeadingForDirectionFromCoordinate:(CLLocationCoordinate2D)fromLoc toCoordinate:(CLLocationCoordinate2D)toLoc
{
    float fLat = degreesToRadians(fromLoc.latitude);
    float fLng = degreesToRadians(fromLoc.longitude);
    float tLat = degreesToRadians(toLoc.latitude);
    float tLng = degreesToRadians(toLoc.longitude);

    float degree = radiansToDegrees(atan2(sin(tLng-fLng)*cos(tLat), cos(fLat)*sin(tLat)-sin(fLat)*cos(tLat)*cos(tLng-fLng)));

    if (degree >= 0) {
        return degree;
    } else {
        return 360+degree;
    }
}
  */




+  (int)locationtoangle:(float)userlon:(float)userlat:(float)loclon:(float)loclat   {
 
     
     float fLat = degreesToRadians(userlat);
     float fLng = degreesToRadians(userlon);
     float tLat = degreesToRadians(loclat);
     float tLng = degreesToRadians(loclon);
  
    
     float degree = radiansToDegrees(atan2(sin(tLng-fLng)*cos(tLat), cos(fLat)*sin(tLat)-sin(fLat)*cos(tLat)*cos(tLng-fLng)));

    if (degree >= 0)  {
        
    
         return  degree;
   
    }
    
         return 360+degree;
 
 /////      :(BOOL)ishighlighted  {
    
    
 
    
}









@end
