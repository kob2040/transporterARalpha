//
//  tripinfo.m
//  AVCam
//
//  Created by ken tee on 26/4/21.
//  Copyright © 2021 Apple. All rights reserved.
//

#import "tripinfo.h"

@implementation tripinfo
 

 
- ( NSString * ) tostring  {
     
     //    return  [NSString stringWithFormat:@"%i min %@" ,  self.remainmins  ,   self.tripid  ];
   
    return  [NSString stringWithFormat:@"%i min " ,  self.remainmins    ];
  
   ///  return  [NSString stringWithFormat:@"%i min to %@" ,  self.remainmins  ,   self.destinationstr   ];
 
    return @"im a trip";
     
}



- (id) keninit :(NSString *)idtoset:(NSString *)deststrtoset:(int)mintoset  {
    
     self.tripid  =   idtoset   ;
     self.destinationstr   =   deststrtoset  ;
     self.remainmins   =   mintoset ;
     
     return self;
    
}
 





@end
