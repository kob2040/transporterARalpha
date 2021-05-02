//
//  prefshelper.m
//  AVCam
//
//  Created by ken tee on 25/4/21.
//  Copyright © 2021 Apple. All rights reserved.
//

#import "prefshelper.h"
 
#import "stopinfo.h"


@implementation prefshelper
 



 +  (NSMutableArray *) getmystns {
 
  
    return  [self getdummystns];
       
     
}

+  (NSMutableArray *) getdummystns {
      
    /*
     
     
 "207720","207720","Hornsby Station","","-33.7028012445","151.098494013","","","1","","","1"
     
  "213710","213710","North Strathfield Station","","-33.8586880092","151.087986143","","","1","","","0"
     
       
     */
    
  NSMutableArray *retray = [[NSMutableArray alloc] init];
          
   //// stopinfo
        
    stopinfo *stopinfoa =  [[stopinfo alloc] keninit :  @"Castle Hill"   :  -33.731481  :  151.007701  ]   ;
    
    NSMutableArray *dummytripsa = [[NSMutableArray alloc] init];
               
     
  [dummytripsa addObject: [[tripinfo alloc] keninit :  @"idhere" : @"desthere" : 21    ]        ];
  [dummytripsa addObject: [[tripinfo alloc] keninit :  @"idhereb" : @"desthere" : 35    ]        ];
    [dummytripsa addObject: [[tripinfo alloc] keninit :  @"idhere" : @"desthere" :   45    ]        ];
     
    
    stopinfoa.myservs = dummytripsa  ;
    
    
    
   [retray addObject:  stopinfoa    ];
    
    
        
    [retray addObject:   [[stopinfo alloc] keninit :  @"Macquarie University"  :  -33.777413  :  151.118187  ]   ];
    
    
 stopinfo *stopinfob =  [[stopinfo alloc] keninit :  @"North Ryde" :   -33.794287   : 151.138042    ]   ;
   NSMutableArray *dummytripsb = [[NSMutableArray alloc] init];
 [dummytripsb addObject: [[tripinfo alloc] keninit :  @"idhere" : @"desthere" :   22    ]        ];
  stopinfob.myservs = dummytripsb  ;
 
 [retray addObject: stopinfob    ];
 
 stopinfo *stopinfoc =  [[stopinfo alloc] keninit :   @"Hornsby"  :  -33.7028012445  :   151.098494013     ]   ;
   NSMutableArray *dummytripsc = [[NSMutableArray alloc] init];
 [dummytripsc addObject: [[tripinfo alloc] keninit :  @"idhere" : @"desthere" :   45    ]        ];
  stopinfoc.myservs = dummytripsc  ;
  
  [retray addObject: stopinfoc ];
 
stopinfo *stopinfod =  [[stopinfo alloc] keninit :     @"North Strathfield"  :   -33.8586880092   :    151.087986143      ]   ;
 NSMutableArray *dummytripsd = [[NSMutableArray alloc] init];
 [dummytripsd addObject: [[tripinfo alloc] keninit :  @"idhere" : @"desthere" :   45    ]        ];
     [dummytripsd addObject: [[tripinfo alloc] keninit :  @"idhere" : @"desthere" :   55    ]        ];
 stopinfod.myservs = dummytripsd  ;
     
     [retray addObject: stopinfod ];
    
 ///   [retray addObject:   [[stopinfo alloc] keninit :  @"North Strathfield"  :   -33.8586880092   :    151.087986143   ]   ];
        
   return retray  ;
         
    
}












@end
