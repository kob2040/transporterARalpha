//
//  stopinfo.m
//  AVCam
//
//  Created by ken tee on 25/4/21.
//  Copyright © 2021 Apple. All rights reserved.
//

#import "stopinfo.h"

@implementation stopinfo
 

- (id) init      {
   
     return self;
     
}
 

 - ( NSString * ) getfirsttripmin   {
     
    if  (  [self.myservs count] > 0   ) {
              
  tripinfo *thistripinfo =   [self.myservs objectAtIndex:  0  ]   ;
 return [thistripinfo tostring] ;
           
      
      }
     
     return @"";
     
     
 }




 - ( NSString * ) tostring  {
     
      
     
 if (  ! self.currentlyvisible    ) {
     
     if (  self.leftofview) {
 
         return   [NSString stringWithFormat:  @"((%@"   ,    [self getfirsttripmin]   ] ;
          
     } else {
                 return   [NSString stringWithFormat:  @"%@))"   ,    [self getfirsttripmin]   ] ;
         
         
     }
     
     
     
    }
     
        
     
 NSMutableString * mymutey  = [[NSMutableString alloc] init];
        
 [mymutey appendString: self.stopname    ] ;
 ////[mymutey appendString:  @"\n"    ] ;
      
     
[mymutey appendString:   [NSString stringWithFormat:@"\nangle [%i]", self.currentangletouser  ]       ] ;
/// [mymutey appendString:  @"\n"    ] ;
     
     
  ////   [mymutey appendString:      ] ;
     
for ( int x = 0 ; x < [self.myservs count]   ; x++  ) {
    
   /// if (  x < ([self.myservs count]  -1) )
         [mymutey appendString:  @"\n"  ] ;
 tripinfo *thistripinfo =   [self.myservs objectAtIndex: x ]   ;
       
 [mymutey appendString:  [thistripinfo tostring]   ] ;
    
  ///  [mymutey appendString:  @"[servhere]"    ] ;
    
 
 
 }
      
      
 
  NSLog(@"\n ##  tostring[%@]   ###"   ,  mymutey      );
     
     
     return mymutey ;
     
     
     
     
 }



- (id) keninit :(NSString *)name:(float)lontoset:(float)lattoset{
 
 self.stopname =  name  ;
     
  self.longitude  =   lontoset  ;
    
 self.latitude  =    lattoset  ;
    
 self.myservs =    [[NSMutableArray alloc] init];
    
 return self;
     
}
  
 

- (id) keninit :(NSString *)name  {
          
    self.stopname =  name  ;
     return self;
     
    
}





@end
