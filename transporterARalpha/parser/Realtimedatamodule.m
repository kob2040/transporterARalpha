//
//  Realtimedatamodule.m
//  Transporter
//
//  Created by ken tee on 11/2/19.
//  Copyright © 2019 kob. All rights reserved.
//



/*
 http://kob.id.au/transporter/SydneyTrains.tzn.txt
 
 */




#import "Realtimedatamodule.h"

////  #import "RegexKitLite.h"
#import "kenstrfuncs.h"

#import "kendatefuncs.h"




@implementation Realtimedatamodule



/*
 // Offload the method onto a background thread, could also use Grand Central Dispatch
 [self performSelectorInBackground:@selector(startTask) withObject:nil];
 
 
 - (void)startTask {
 NSString *hostsforping = @"google.es";
 NSTask *pingdata = [[NSTask alloc] init];
 [pingdata setLaunchPath: @"/sbin/ping"];
 
 NSArray *pingargs;
 pingargs = [NSArray arrayWithObjects: @"-c 5", hostsforping, nil];
 [pingdata setArguments: pingargs];
 
 NSPipe *pingpipe;
 pingpipe = [NSPipe pipe];
 [pingdata setStandardOutput: pingpipe];
 
 NSFileHandle *pingfile;
 pingfile = [pingpipe fileHandleForReading];
 
 [pingdata launch];
 
 NSData *pingdata1;
 pingdata1 = [pingfile readDataToEndOfFile];
 
 NSString *pingstring;
 pingstring = [[NSString alloc] initWithData: pingdata1 encoding: NSUTF8StringEncoding];
 [[NSNotificationCenter defaultCenter] addObserver:self
 selector:@selector(taskDidTerminate:)
 name:NSTaskDidTerminateNotification
 object:nil];
 }
 
 - (void) taskDidTerminate:(NSNotification *)notification {
 // Note this is called from the background thread, don't update the UI here
 ////  // // // // // // // //// NSLog(@"end");
 
 // Call updateUI method on main thread to update the user interface
 [self performSelectorOnMainThread:@selector(updateUI) withObject:nil waitUntilDone:NO];
 }
 
 
 Public URI: https://api.transport.nsw.gov.au/v1/gtfs/realtime/
 
 Operations:
 GET /sydneytrains
 GET /buses
 GET /ferries
 GET /lightrail/
 GET /nswtrains
 GET /regionbuses/
 GET /metro
 */

 
 /*
 
 
+  (NSString *)getveichlepositionscurl:(NSString *)meserv  {
    
  
    NSTask *task  = [[NSTask alloc] init];
    
    [task setLaunchPath: @"/usr/bin/curl"];
  
 NSString * mefeed =  [NSString stringWithFormat:@"https://api.transport.nsw.gov.au/v1/gtfs/realtime/%@?debug=true",   meserv    ]    ;
    
    [task setArguments: [NSArray arrayWithObjects:
                         @"-X"  , @"GET"  ,
                         @"--header"  ,  @"Accept: application/x-google-protobuf"  ,
                         @"--header"  ,  @"Authorization: apikey zRl3O9iTMlcNTuC2XRXPIQsCneyASEvn0fzM"  ,
                        mefeed  ,  nil]  ];
    
    NSPipe *pipe  = [NSPipe pipe];
    [task setStandardOutput: pipe];
    
    NSFileHandle *file  = [pipe fileHandleForReading];
    
    [task launch];
    
    NSData *data  = [file readDataToEndOfFile];
    
    NSString *string  = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
    
    
    return string ;
    
    
}

 ////////
 */ 

 
 /*
 
 
+ (int)getminuteslateforthisrealtimedict:(NSDictionary *)realtimedict {
    
    int maxdelay =  0 ;
     
for (  int thrustops = 0  ;   thrustops <   [[realtimedict objectForKey:  @"delayedstoptimes" ] count]   ; thrustops++   ) {
        
   ///////n   int thisdelay =   [[[[realtimedict objectForKey:  @"delayedstoptimes" ] objectAtIndex:  thrustops  ] objectForKey:  @"delay" ]  intValue]   ;
    
   if ( [[[[realtimedict objectForKey:  @"delayedstoptimes" ] objectAtIndex:  thrustops  ] objectForKey:  @"delay" ]  intValue]  > maxdelay   )
        maxdelay =   [[[[realtimedict objectForKey:  @"delayedstoptimes" ] objectAtIndex:  thrustops  ] objectForKey:  @"delay" ]  intValue]   ;
  
 }
    
    return maxdelay ;
    
    
}
 */ 

 /*
  

+ (BOOL)isthisinthatbool:(NSString *)stringa:(NSString *)stringb {
    
    NSString *stringaa   =   [NSString stringWithFormat:@"%@" , stringa     ] ;
    NSString *stringbb   =   [NSString stringWithFormat:@"%@" ,  stringb    ] ;
    
    if  (   ! ( [stringbb rangeOfString: stringaa].location == NSNotFound)   ) {
        return  YES  ;
    }
    
    return NO  ;
    
}
 */




+ (int)secondstominutes:(int)secondsigot {
    
    return (secondsigot/60);
    
}
 

+ (NSDictionary *)getminslatethesestopids:(int)depstopid:(int)deststopid:(NSDictionary *)realtimedict {
    
    int depminlatetoreturn = 0 ;
    int destminlatetoreturn = 0 ;
    
 ////  // // // // // // // //// NSLog( @"\n #####  begin getminslatethesestopids  depstopid [%i]  [%i]   ####### \n " ,   depstopid    ,  deststopid   );
    
 for (  int thrustops = 0  ;   thrustops <   [[realtimedict objectForKey:  @"delayedstoptimes" ] count]   ; thrustops++   ) {
    
     
 int distopidigot  =       [[[[realtimedict objectForKey:  @"delayedstoptimes" ] objectAtIndex:  thrustops  ] objectForKey:   @"stopid" ]  intValue]    ;
     
      ////  // // // // // // // //// NSLog( @"\n #####   are you da one [%i]  ####### \n " ,   distopidigot    );
     
     
     
 if ( [[[[realtimedict objectForKey:  @"delayedstoptimes" ] objectAtIndex:  thrustops  ] objectForKey:   @"stopid" ]  intValue]  ==  depstopid ) {
     
     
 
     
 depminlatetoreturn =  [[[[realtimedict objectForKey:  @"delayedstoptimes" ] objectAtIndex:  thrustops  ] objectForKey:  @"delay" ]  intValue] ;
            
 } else if ( [[[[realtimedict objectForKey:  @"delayedstoptimes" ] objectAtIndex:  thrustops  ] objectForKey:   @"stopid" ]  intValue] == deststopid) {
     
  ////  // // // // // // // //// NSLog( @"\n #####  getminslatethesestopids deststopid [%i]  matchedwith [%i]   ####### \n " ,   deststopid   ,  [[[[realtimedict objectForKey:  @"delayedstoptimes" ] objectAtIndex:  thrustops  ] objectForKey:   @"stopid" ]  intValue]     );
     
destminlatetoreturn =  [[[[realtimedict objectForKey:  @"delayedstoptimes" ] objectAtIndex:  thrustops  ] objectForKey:  @"delay" ]  intValue] ;
break;
     
}
        
  }
  
    return  [NSDictionary dictionaryWithObjectsAndKeys:
             @(depminlatetoreturn)   , @"depminlatekey"  ,
             @(destminlatetoreturn)  , @"destminlatekey"   ,
              nil] ;
    
}

+ (NSMutableArray *)getstopidsandstoptimes:(NSString *)stringb {
    
    /*
     trip {
     trip_id: "123E.974.131.124.A.8.59966223"
     schedule_relationship: REPLACEMENT
     route_id: "NTH_2a"
     }
     stop_time_update {
     arrival {
     time: 1581282450
     }
     departure {
     time: 1581282510
     }
     stop_id: "2077303"
     }
     stop_time_update {
     arrival {
     time: 1581282660
     }
     departure {
     time: 1581282690
     }
     stop_id: "2076231"
     }
     stop_time_update {
     arrival {
     time: 1581282840
     }
     departure {
     time: 1581282870
     }
     stop_id: "2120212"
     }
     stop_time_update {
     arrival {
     time: 1581282960
     }
     */
    
    
    NSMutableArray *thesestopsandtimes    =   [[NSMutableArray alloc] init];
    
    NSArray *linesf = [stringb componentsSeparatedByString:@"stop_time_update"];
    // ////  // // // // // // // //// NSLog( @"\n #### stringb [%@]  ### \n ",   stringb    );
    
    for ( int x = 0  ; x  < [linesf count]   ; x++ ) {
        
 NSArray  *delayray  = [[linesf objectAtIndex:  x  ] componentsMatchedByRegex: @"(?<=delay:\\s)[0-9]{1,}"];
 NSArray  *stopidray  = [[linesf objectAtIndex:  x  ] componentsMatchedByRegex: @"(?<=stop_id:\\s\\\")[0-9]{1,}"];
        
        
 NSArray  *departtimeray   = [[linesf objectAtIndex:  x  ] componentsMatchedByRegex: @"(?<=departure\\s\\\{\n.{1,11}time\\\:\\s)[0-9]{1,1000}"];
            
 // // // //// NSLog( @"\n ####  departtimeray descr [%@]  ### \n ",   [departtimeray description]   );
        
        if (  [departtimeray count] > 0 &&   [stopidray count] > 0      ) {
            
             int minuteslate =   0   ;
            if (  [delayray count] > 0  ) {
                minuteslate =  [self secondstominutes : [[delayray objectAtIndex:  0 ] intValue]]   ;
            }
            ///  int minuteslate =  [self secondstominutes : [[delayray objectAtIndex:  0 ] intValue]]   ;
            
            
            [thesestopsandtimes addObject:
             [NSDictionary dictionaryWithObjectsAndKeys:
               @(minuteslate)  ,@"delay" ,
              [self opendatartdatetonsdate: [departtimeray objectAtIndex:  0  ]   ]  , @"dep"  ,
                @([[stopidray objectAtIndex:  0  ] intValue])    , @"stopid"  ,
              nil]
             ];
            
        }
        
        
      ////  NSArray  *departtimeray   = [[linesf objectAtIndex:  x  ] componentsMatchedByRegex: @"(?<=time:\\s)[0-9]{1,}"];
        
        /*
        departure {
        time: 1581282510
        }
        */
        
        
    }
    
    
    
    return thesestopsandtimes ;
    
    
}



+ (NSDate *)opendatartdatetonsdate:(NSString *)stringb {
    
   ////  int opendatamin =  [stringb intValue]  ;
    
    return   [kendatefuncs secondspast1970todate:  [stringb intValue]   ];
    
   /// return  [NSDate date]   ;
    
}

+ (NSMutableArray *)gettimedelaysforthistrip:(NSString *)stringb {
    
    
    /*
     
     zzz z z z z zz z z z z z z z z z z z z z z z z z z z
     stop_time_update {
     arrival {
     delay: 0
     }
     departure {
     delay: 0
     }
     stop_id: "2000324"
     schedule_relationship: SCHEDULED
     }
     NSString * mystr = @"(?<=url\\=\\\")http[-a-zA-Z0-9@:%_\+.~#?\/=]{1,}\\.mp3(?=\\\"\\slength)" ;
     
     */
    
    
    NSMutableArray *thesedelays   =   [[NSMutableArray alloc] init];
    
    NSArray *linesf = [stringb componentsSeparatedByString:@"stop_time_update"];
    // ////  // // // // // // // //// NSLog( @"\n #### stringb [%@]  ### \n ",   stringb    );
    
    for ( int x = 0  ; x  < [linesf count]   ; x++ ) {
        
        NSArray  *delayray  = [[linesf objectAtIndex:  x  ] componentsMatchedByRegex: @"(?<=delay:\\s)[0-9]{1,}"];
        
        
        NSArray  *stopidray  = [[linesf objectAtIndex:  x  ] componentsMatchedByRegex: @"(?<=stop_id:\\s\\\")[0-9]{1,}"];
        
        
        
        
        if ( [delayray count] > 0  &&    ( [stopidray count] > 0  )  ) {
            // ////  // // // // // // // //// NSLog( @"\n #### delayray descrip [%@]    ####### \n ",  [delayray description]     );
            
             //// ////  // // // // // // // //// NSLog( @"\n #### stopidray descrip [%@]    ####### \n ",  [stopidray description]     );
            
            
            
            
            int minuteslate =  [self secondstominutes : [[delayray objectAtIndex:  0 ] intValue]]   ;
            
            /// thesedelays thesedelays thesedelays thesedelays thesedelays
            if (minuteslate > 1 ) {
                [thesedelays addObject:
                 [NSDictionary dictionaryWithObjectsAndKeys:
                  @(minuteslate)   ,@"delay" ,
                 @([[stopidray objectAtIndex:  0  ] intValue])   , @"stopid"  ,
                  nil]
                 ];
            }
        }
        
        
        
    }
    
    
    /*
     stop_time_update {
     arrival {
     delay: 0
     }
     departure {
     delay: 0
     }
     stop_id: "2000340"
     schedule_relationship: SCHEDULED
     }
     */
    
    
    return thesedelays ;
    
    
    
}


 
+ (NSString * )getcurlstrforthisnetwork:(NSString *)mahtablename   {
    
    if (      [kenstrfuncs isthisinthat:  @"SydneyTrains" :  mahtablename ]    )
    return @"sydneytrains" ;
    
    if (      [kenstrfuncs isthisinthat:  @"SydneyMetro" :  mahtablename ]    )
    return @"metro";
 
    
 return @"";
    
}
 


+ (NSMutableArray * )getrealtimedatamultifeed:(NSMutableArray *)tablesmatched:(NSMutableArray *)loadedtables  {
    
    NSMutableArray * retray  = [[NSMutableArray alloc] init];
    
      /*
    
 for  ( int x = 0 ; x < [tablesmatched count] ; x++ ) {
     
      if ( [tablesmatched objectAtIndex:x] b     )
     [retray addObject:     [self getrealtimedata:   @""   ]  ]   ;
     
 }
        */
    
    
    return retray ;
    
}


 /*
 
 
 + (NSDictionary * )getrealtimedata:(NSString *)menetwork   {
     
    NSMutableArray *myservs =   [[NSMutableArray alloc] init];
    
    ////  NSString *mystr = [self  getveichlepositionscurl:   menetwork  ];
    
    ///    NSString *mystr = [self readfile:  @"/Users/kob/realtimesample.txt"  ]  ;
    
    /// [self readfile:  @"/Users/kob/realtimesample.txt"  ] ;
    
  NSArray *linesf = [[self  getveichlepositionscurl:   menetwork  ]   componentsSeparatedByString:@"entity"];
    
    // ////  // // // // // // // //// NSLog( @"\n ####   BEG  ####### \n "  );
    
    for (int x = 0 ; x <  [linesf count] ;  x++  ) {
        
      //   if ( [self isthisinthatbool : @"delay" :  [linesf objectAtIndex:  x  ] ]  ||  [self isthisinthatbool : @"CANCELED" :  [linesf objectAtIndex:  x  ] ]      ) {
            
        ////   ( [self isthisinthatbool : @"delay" :  [linesf objectAtIndex:  x  ] ]  )
            
 BOOL replacementbool = NO  ;
  //// BOOL cancelledbool  =  ( [self isthisinthatbool : @"CANCELLED" :  [linesf objectAtIndex:  x  ] ]  )   ;
            
  NSMutableArray *mydelays  =   [self gettimedelaysforthistrip:  [linesf objectAtIndex:  x  ]  ];
            
            // ////  // // // // // // // //// NSLog( @"\n ####  x [%i] ####### \n ",  x    );
            
           ////  NSArray  *myregexray  = [[linesf objectAtIndex:  x  ] componentsMatchedByRegex: @"trip_id"];
            
  NSArray  *schedray   = [[linesf objectAtIndex:  x  ] componentsMatchedByRegex: @"(?<=schedule_relationship:\\s)[a-zA-Z]{1,}"];
            //  NSArray  *schedray   = [[linesf objectAtIndex:  x  ] componentsMatchedByRegex: @"schedule_relationship[\\s-a-zA-Z0-9@:%_\+.~#?\/=]{1,}"];
            
            // ////  // // // // // // // //// NSLog( @"\n #### schedray descrip [%@]    ####### \n ",  [schedray description]     );
            
            NSArray  *mtripidray  = [[linesf objectAtIndex:  x  ] componentsMatchedByRegex: @"(?<=trip_id:\\s\\\")[-a-zA-Z.0-9]{1,}"];
            
 // ////  // // // // // // // //// NSLog( @"\n #### mtripidray descrip [%@]    ####### \n ",  [mtripidray description]     );
        
            if (  [mtripidray count]  > 0  &&   [schedray count]  > 0   ) {
                
                [myservs addObject:
                 [NSDictionary dictionaryWithObjectsAndKeys:
                  [mtripidray objectAtIndex:  0  ]  ,@"tripid" ,
                  /////  [self schedulestringtonumber:  [schedray objectAtIndex:  0  ] ], @"schedulestat"  ,
                  mydelays  ,@"delayedstoptimes" ,
               [NSNumber numberWithBool:  (  [kenstrfuncs isthisinthat:   @"CANCELLED" :  [linesf objectAtIndex:  x  ] ]  ) ] ,@"amcancelled" ,
                  [NSNumber numberWithBool:replacementbool]  ,@"amreplacement" ,
                  nil]
                 ];
                
                
            }
            
            
      //   }
        
        
        
        
    }
    
    
    
    // ////  // // // // // // // //// NSLog(@" myservs description[%@]"  ,  [myservs description]   );
    
    return  [NSDictionary dictionaryWithObjectsAndKeys:
             [NSDate date]  ,@"dateodata" ,
             myservs  , @"servs"  ,
             nil] ;
    
    
    ///////  return myservs;
  
    
}
 */ 


+ (NSDictionary * )parserealtimetripupdatesstring:(NSString *)mahstr:(NSMutableArray *)routeidsiwant   {
    
    
    NSMutableArray *scheduledservs =   [[NSMutableArray alloc] init];
    NSMutableArray *replacementsrvs =   [[NSMutableArray alloc] init];
    
    NSArray *linesf = [ mahstr componentsSeparatedByString:@"entity"];
    
    // ////  // // // // // // // //// NSLog( @"\n ####   BEG  ####### \n "  );
    
 // NSLog( @"\n ####  parserealtimetripupdatesstring [%@]   ####### \n "  , mahstr      );
    
    for (int x = 0 ; x <  [linesf count] ;  x++  ) {
        
        //// BOOL cancelledbool  =  ( [self isthisinthatbool : @"CANCELLED" :  [linesf objectAtIndex:  x  ] ]  )   ;
        
        //// NSArray  *mtripidray  = [[linesf objectAtIndex:  x  ] componentsMatchedByRegex: @"(?<=trip_id:\\s\\\")[-a-zA-Z.0-9]{1,}"];
        
        //  // // // // // // // //// NSLog( @"\n #### mtripidray descrip [%@]    ####### \n ",  [mtripidray description]     );
        
 NSArray  *routeidray  = [[linesf objectAtIndex:  x  ] componentsMatchedByRegex: @"(?<=route_id:\\s\\\")[_-a-zA-Z.0-9]{1,}"];
         
    // NSLog( @"\n ####   maximeow  ####### \n "       );
        
        
  if   ( [ [self getrouteidsiwantfromthisray:   routeidray : routeidsiwant  ]   count] > 0  ) {
                // NSLog( @"\n ####   maxiwow  ####### \n "       );
 NSArray  *schedray   = [[linesf objectAtIndex:  x  ] componentsMatchedByRegex: @"(?<=schedule_relationship:\\s)[a-zA-Z]{1,}"];
            
            
            /////       TRIPIDS not showing upppp ??? try checking parser....
            NSArray  *mtripidray  = [[linesf objectAtIndex:  x  ] componentsMatchedByRegex: @"(?<=trip_id:\\s\\\")[-a-zA-Z.0-9]{1,}"];
            
            ////  trip_id: "109-19.060421.15.1755"
            
 // NSLog(@"  [routeidray count][%i][mtripidray count][%i][schedray count][%i]  ",  [routeidray count],  [mtripidray count]  ,   [schedray count]    );
                              
            
            
  if (   [routeidray count]  > 0 &&    [mtripidray count]  > 0  &&   [schedray count]  > 0   ) {
                
                //  // // // // // // // //// NSLog( @"\n #### realtimerecievedtripidddddddd[%@]    ####### \n ",  [mtripidray objectAtIndex:  0  ]        );
        
  if (  [kenstrfuncs isthisinthat:   @"REPLACEMENT" :  [linesf objectAtIndex:  x  ] ]   ) {
                  
                  
                    /*
                     id: "123E.974.131.124.A.8.59966223"
                     trip_update {
                     trip {
                     trip_id: "123E.974.131.124.A.8.59966223"
                     schedule_relationship: REPLACEMENT
                     route_id: "NTH_2a"
                     }
                     stop_time_update {
                     arrival {
                     time: 1581282450
                     }
                     departure {
                     time: 1581282510
                     }
                     stop_id: "2077303"
                     }
                     */
                    
 
                    [replacementsrvs addObject:
                     [NSDictionary dictionaryWithObjectsAndKeys:
                      [self getstopidsandstoptimes:  [linesf objectAtIndex:  x  ]  ]  ,@"stopsandtimes" ,
                      [mtripidray objectAtIndex:  0  ]  ,@"tripid" ,
                      [routeidray objectAtIndex:  0  ]  ,@"routeid" ,
                      nil]
                     ];
                    
                }
                
                    /////
              ////  } else {
                    /// add it to both as replacements can run late
                    
                    ///// NSMutableArray *mydelays  =   [self gettimedelaysforthistrip:  [linesf objectAtIndex:  x  ]  ];
                    
                    
                    [scheduledservs addObject:
                     [NSDictionary dictionaryWithObjectsAndKeys:
                      [mtripidray objectAtIndex:  0  ]  ,@"tripid" ,
                      [routeidray objectAtIndex:  0  ]  ,@"routeid" ,
                      /////  [self schedulestringtonumber:  [schedray objectAtIndex:  0  ] ], @"schedulestat"  ,
                     [self gettimedelaysforthistrip:  [linesf objectAtIndex:  x  ]  ]  ,@"delayedstoptimes" ,
                      ///   []  ,@"delayedstoptimes" ,
                      @(  [kenstrfuncs isthisinthat:   @"CANCELED" :  [linesf objectAtIndex:  x  ] ]  )  ,@"amcancelled" , nil]
                     ];
                    
            ///    }
                
                
                
                
            }
            
            
        }
        
        
        
    }
    
    
    
    // // // // // //// NSLog( @"\n #####   [scheduledservs count][%i]  ####### \n "  ,   [scheduledservs count]   );
    
    return  [NSDictionary dictionaryWithObjectsAndKeys:
             [NSDate date]  ,@"dateodata" ,
             scheduledservs , @"servs"  ,
             replacementsrvs , @"replacements"  ,
             @1   , @"rtdatatype"  ,
             nil] ;
    
    
}



+ (NSString * ) gettimestampfromrealtimedata:( NSString * )mystr  {
   
    NSArray  *descriptionray  = [mystr componentsMatchedByRegex: @"(?<=timestamp:\\s)[0-9]{1,}"];
    
    if ( [descriptionray count] > 0 ) {
        
        return  [descriptionray objectAtIndex: 0 ];
        
    }
    
    return NULL;
    
}

+ ( NSString *  ) getdescriptiontextthisalert:( NSString * )mystr  {
    
  NSArray  *textray  = [mystr componentsMatchedByRegex: @"(?<=text:\\s{1,4}\\\")[-a-zA-Z0-9@:%_\+,.~#?\/=\\\s\(\)'\\\\]{1,}"  ];
    
    if ( [textray count] > 0 ) {
        
         ////  [textray objectAtIndex:  ( [textray count] -1 )   ]
/////  [textray objectAtIndex:  ( [textray count] -1 )   ] ;
        
        
 //// NSString * retstr =  [kenstrfuncs kenstrreplace:  [textray objectAtIndex:  ( [textray count] -1 )   ]  :   @"\\n" : @"." ] ;
       
        return [kenstrfuncs kenstrreplace:  [kenstrfuncs kenstrreplace:  [textray objectAtIndex:  ( [textray count] -1 )   ]  :   @"\\n" : @"." ]  :   @"\\" : @"" ] ;
        
    //////  return   [textray objectAtIndex:  ( [textray count] -1 )   ] ;
        
    }
    
    return NULL ;
    
}
 
+ (NSMutableArray * ) getrouteidsiwantfromthisray:( NSArray * )rtrids:(NSMutableArray *)routeidsiwant {
     
 // NSLog(@"gggetrouteidsiwantfromthisray rtrids [%@] routeidsiwant[%@] " , [rtrids description] ,   [routeidsiwant description]    );
     
    
 NSMutableArray *retray   =  [[NSMutableArray alloc] init];
  // // // // // // // // //// NSLog
    
 for ( int thrurtrids = 0 ; thrurtrids < [rtrids count] ;  thrurtrids++ ) {
        
 for ( int thrumyrids = 0 ; thrumyrids < [routeidsiwant count] ; thrumyrids++ ) {
     
 if (  [[  [routeidsiwant objectAtIndex : thrumyrids ] objectForKey :  @"ridstr" ]
           isEqualToString:   [ rtrids objectAtIndex: thrurtrids ]  ]     ) {
                    
      [retray addObject : [routeidsiwant  objectAtIndex : thrumyrids ]   ] ;
     
 }
            
            
        }
            
    }
    
    return retray ;
    
}



+ (NSDictionary * ) parserealtimealertstring:( NSString * )mystr:(NSMutableArray *)routeidsiwant:( NSString * )lasttimestamp  {
    
    // // // // // // //// NSLog( @"\n ####   BEGin  parserealtimealertstring  str [%@]  ####### \n " ,  mystr     );
    // // // // // // //// NSLog( @"\n ####   BEGin  parserealtimealert with routeid i want  with rids  i want [%@]  ####### \n " ,  [routeidsiwant description]     );
    
    
    NSString *mytimestamp =   [self gettimestampfromrealtimedata: mystr ];
    
    if (  [mytimestamp  isEqualToString:  lasttimestamp ]   )
        return NULL;
    
    NSMutableArray *myalerts =   [[NSMutableArray alloc] init];
    
    NSArray  *entityray  = [mystr componentsSeparatedByRegex: @"entity\\s\.{1,18}\\n\.{1,18}\\sid"];
    
    // // // // // // //// NSLog( @"\n #### ALERT entityray count [%i]  ####### \n " ,  [entityray count]     );
    
    for ( int x = 0  ; x  <  [entityray count]    ; x ++ ) {
        
        NSArray *ridsthisentity  =   [self getrouteidsthisentity:  [entityray objectAtIndex:x ]   ];
        
        // // // // // // //// NSLog( @"\n #### entity  [%i] has routeids [%@]    ####### \n " ,  x   ,  [ridsthisentity description]      );
        
        if  (   [ridsthisentity count]  > 0   ) {
            
            
            NSMutableArray *routeidsiactuallywant = [self getrouteidsiwantfromthisray:  ridsthisentity: routeidsiwant  ]   ;
            
            ////  // // // // // // //// NSLog( @"\n #### DEBUGGING ALERT [%i]  HAS RIDS [%@] WITH DESCRIPTION [%@]  ####### \n " ,  x  ,  [ridsthisentity count]   ,   [self getdescriptiontextthisalert:   [entityray objectAtIndex:x ]     ]     );
            
            
            
            // // // // // // // // //// NSLog( @"\n #### ridsthisentity count [%i]  ####### \n " ,  [ridsthisentity count]     );
            if ( [routeidsiactuallywant count] > 0 ) {
                ////  if ( [ridsthisentity count] > 0 ) {
                
                // // // // // // //// NSLog( @"\n #### got alert i want  ####### \n "     );
                 
                NSString *  descriptiontextthisalert =   [self getdescriptiontextthisalert:   [entityray objectAtIndex:x ]     ]    ;
                
               // // // // // // //// NSLog( @"\n #### descriptiontextthisalert  [%@]   ####### \n " ,  descriptiontextthisalert  );
                
                if ( descriptiontextthisalert != NULL ) {
                    
                    [myalerts addObject:   [NSDictionary dictionaryWithObjectsAndKeys:
                                            routeidsiactuallywant    ,@"routeids" ,
                                            descriptiontextthisalert  , @"alert"  ,
                                            nil]        ];
                    
                }
                
                
            }
            
            
        }
        
    }
    
    
    return  [NSDictionary dictionaryWithObjectsAndKeys:
             mytimestamp  ,@"dateodata" ,
             @2   , @"rtdatatype"  ,
             myalerts  , @"alerts"  ,
             [self allalertsasstring:  myalerts  ]  , @"allalerts"  ,
             nil] ;
    
}


+  ( NSString * ) allalertsasstring:( NSMutableArray * )myalertsray  {
    
     NSMutableString * mutestr   = [[NSMutableString alloc] init];
    
        for ( int x = 0 ;   x <  [myalertsray count]  ;  x++   ) {
             [mutestr appendString: [[myalertsray objectAtIndex: x  ]  objectForKey: @"alert"  ]   ];
          }
    
    
     /*
    
    
    for ( int x = 0 ;   x < [[myalertsray objectForKey:@"alerts" ] count]  ;  x++   ) {
       
          [mutestr appendString: [[[myalertsray objectForKey:@"alerts" ] objectAtIndex: x  ] objectForKey: @"alert"  ]   ] ;
        
    }
       */
    
    return mutestr ;
    
    
}


+  (NSArray *)getrouteidsthisentity:( NSString * )mystr  {
// +  (NSArray *)getrouteidsthisalert:( NSString * )mystr  {
  return [mystr componentsMatchedByRegex: @"(?<=route_id:\\s\\\")[_-a-zA-Z.0-9]{1,}"];
   
}
  
+ (char )getcapacityfromentity:(NSString *)mahstr   {
    
    NSArray  *occuray  =   [mahstr componentsMatchedByRegex: @"(?<=occupancy\\\"\\\:\\\")[A-Z]{1,}"];
    
    if ( [occuray count] > 0  ) {
        
        // // //// NSLog(@"\n ## [occuray [%@]    ###"   ,   [occuray description]   );
        
        if (  [[[occuray objectAtIndex: 0 ] componentsMatchedByRegex: @"MANY"] count] > 0 )
            return 1 ;
        
        ///     return 2  ;
        
        if (  [[[occuray objectAtIndex: 0 ] componentsMatchedByRegex: @"FEW"] count] > 0 )
            return 3 ;
        
        if (  [[[occuray objectAtIndex: 0 ] componentsMatchedByRegex: @"STANDING"] count] > 0 )
            return 4  ;
        
        
    }
    return 0 ;
    
}


+ ( NSArray  *  ) gettripidsthisentityb:(NSString *)mahstr   {
     return  [mahstr componentsMatchedByRegex: @"(?<=AVMSTripID\\\"\\\:\\\")[-a-zA-Z.0-9]{1,}"];
 }




+ (int )getdepartureplannedestimatedfromentity :(NSString *)mahstr   {
 
      
 // NSLog( @"\n #####   beg getdepartureplannedestimatedfromentity   ####### \n "     );
 NSArray *myrayc =    [mahstr componentsMatchedByRegex: @"(?<=departureTimePlanned\\\"\\\:\\\")[\\\:-a-zA-Z.0-9]{1,}"];
 
    
    if (  [myrayc count] > 0  ) {
        NSArray *myrayd =    [mahstr componentsMatchedByRegex: @"(?<=departureTimeEstimated\\\"\\\:\\\")[\\\:-a-zA-Z.0-9]{1,}"];
              if (  [myrayd count] > 0 ) {
                 
  if (  !  [ [myrayc objectAtIndex: 0 ]  isEqualToString:  [myrayd objectAtIndex: 0 ] ]   ) {
             
       // NSLog( @"\n #####    OFF TIMESERVICE   ####### \n "     );
      
  }
                  
                  
  }
     
    }
    
    
  // NSLog( @"\n #####   departureTimePlanned  [%@]   ####### \n " ,  [myrayc  description]     );
  
    /*
this:  get diff
    
    "departureTimePlanned":
    "2021-04-07T10:51:00Z",
    "departureTimeEstimated":
    "2021-04-07T10:51:00Z",
     */
    
    
 
    return 0 ;
    
    
    
}





+ (NSDictionary * )parsetripplaner_for_capac :(NSString *)mahstr:(NSString *)datestr    {
    
 //// NSLog( @"\n ##    IM CAPACITY PARSING IM CAPACITY PARSING  "  );
    //// NSLog( @"\n ##   mahstr [%@]   " , mahstr   );
    
    NSArray  *entityray  = [mahstr  componentsSeparatedByRegex: @"RealtimeTripId"];
    //// NSArray  *entityray  = [mahstr  componentsSeparatedByRegex: @"isRealtimeControlled"];
    NSMutableArray *myservs =    [[NSMutableArray alloc] init];
    
    for ( int x = 0  ; x  <  [entityray count]    ; x ++ ) {
        
 char mycapac  =  [self getcapacityfromentity :  [entityray objectAtIndex: x ]   ];
   ////  char mycapac  =  [self getcapacityfromentity :  [entityray objectAtIndex: x ]   ];
    
  char mydelay  =  [self getdepartureplannedestimatedfromentity :  [entityray objectAtIndex: x ]   ];
         
  if ( mycapac  > 0    ) {
           
       NSArray *tripidray =  [self gettripidsthisentityb:  [entityray objectAtIndex: x ]   ];
       
     if (   [tripidray count] > 0  ) {
            
            // // //// NSLog( @"\n   tripidray[%@]    \n  ",    [tripidray description]     );
            
            [myservs addObject:     [NSDictionary dictionaryWithObjectsAndKeys:
                                     @(mycapac)   ,@"mycapac" ,
                                     [tripidray objectAtIndex: 0  ]   ,@"tripid" ,
                                     nil]      ];
        }
                
        }
        
    }
    
    
    return   [NSDictionary dictionaryWithObjectsAndKeys:
               @5 , @"rtdatatype"  ,
              myservs   ,@"mahservs" ,
               [NSDate date]  ,@"dateodata" ,
              nil] ;
    
    /*
     return  [NSDictionary dictionaryWithObjectsAndKeys:
             @0 , @"rtdatatype"  ,
             nil] ;
      */
    
}





+ (NSDictionary * )parserealtimedatastr:(NSString *)mahstr:(NSMutableArray *)routeidsiwant:(int)typeodataimparsing   {
     
    
 // NSLog( @"\n  ##### [beginparserrealtimeee] ##### #####   "    );
   // NSLog( @"\n  #####  [%@]   "  ,   mahstr   );
    
    
    /*
     typeodataimparsing
     0 = unkown / null
     1 = tripupdates
     2 = alerts
      
     5 = tripplanner
     */
    
    
    
    
    if ( typeodataimparsing == 1 ) {
        
   return [self parserealtimetripupdatesstring : mahstr  :  routeidsiwant  ] ;
        
    } else if ( typeodataimparsing == 2)   {
        
    return [self parserealtimealertstring : mahstr  :  routeidsiwant  : @"last"  ] ;
        
    } else if ( typeodataimparsing == 3)   {
        
        return [self  parseveichlelocstr : mahstr  :  routeidsiwant  : @"datehere"  ] ;
        
    } else if ( typeodataimparsing == 5 )   {
        
        return [self  parsetripplaner_for_capac : mahstr  :  @"datehere"  ] ;
        
    }
        
  return  [NSDictionary dictionaryWithObjectsAndKeys:
                       @0 , @"rtdatatype"  ,
                        nil] ;
    
   //// unkown data type
    
   
    
}




+ (char  )getcongestionlevel:(NSString *)mahstr   {
    
   
    /*
      0 no data
     1 unknown
     2 many seats avail
     3 etc
     
     */
    
    NSArray  *congestray  = [mahstr componentsMatchedByRegex: @"(?<=congestion_level:\\s\)[_-a-zA-Z0-9]{1,600}"];
    
    if ( [congestray count]  > 0   ) {
          if ( [ kenstrfuncs isthisinthat:  @"UNKNOWN"   : [congestray objectAtIndex: 0 ]    ] )
            return 1;
        if ( [ kenstrfuncs isthisinthat:  @"UNKNOWN"   : [congestray objectAtIndex: 0 ]    ] )
            return 1;
        if ( [ kenstrfuncs isthisinthat:  @"UNKNOWN"   : [congestray objectAtIndex: 0 ]    ] )
            return 1;
        
     }
    
    return   0   ;
    
}


+ ( NSArray  *  ) gettripidsthisentity:(NSString *)mahstr   {
    
  return  [mahstr componentsMatchedByRegex: @"(?<=trip_id:\\s\\\")[-a-zA-Z.0-9]{1,}"];
    
}

+ (NSDictionary * )parseveichlelocstr:(NSString *)mahstr:(NSMutableArray *)routeidsiwant:(NSString *)datestringolastparse   {
    
    // // // // // // // //// NSLog(@"\n ##   parseveichlelocstr [%@]    ###"   ,  mahstr    );
    
    NSMutableArray *retray   = [[NSMutableArray alloc] init];
    
   ////   NSArray *linesf = [mahstr componentsSeparatedByString:@"entity {\\n\\s\\s"];
        NSArray *linesf = [mahstr componentsSeparatedByString:@"entity {"];
    
    
    for ( int x = 0 ; x  <   [linesf count]   ; x++  ) {
        
        char thiscongest =   [self getcongestionlevel :  [linesf objectAtIndex: x   ]   ];
        
        if ( thiscongest > 0 ) {
           
            NSArray *mytripidray = [self gettripidsthisentity : mahstr  ] ;
            
            if ( [mytripidray count] > 0  ) {
                
                [retray addObject:     [NSDictionary dictionaryWithObjectsAndKeys:
                                       @(thiscongest)     ,@"congestion" ,
                                        [mytripidray  objectAtIndex: 0  ]     ,@"tripid" ,
                                        nil]       ] ;
            }
            
            
        }
        
    }
    
    
    
    /*
     
     
     
     [NSDictionary dictionaryWithObjectsAndKeys:
     ////   [self linenametonums : thislinestr   ]  , @"linenums" ,
     [self linenametotablelineseqnums : thislinestr   ]  , @"tablelineseqnums" ,
     begdate    ,@"trakbegin",
     enddate      ,@"trakend" ,
     thisinfostr    ,@"originfostr" ,
     nil]
     ];
     
     congestion_level: UNKNOWN_CONGESTION_LEVEL
     stop_id: "Hornsby.HY54 Loc"
     
     return    [NSDictionary dictionaryWithObjectsAndKeys:
     [NSNumber numberWithInt: parseddataid  ]   ,@"parseddatatypeid" ,
     @""   ,@"zbzbzzbzbzbzb" ,
     @""   ,@"mahveichlelocs" ,  nil] ;
     
     */
    
    
    
    return    [NSDictionary dictionaryWithObjectsAndKeys:
               @3  , @"rtdatatype"  ,
               retray     ,@"mahlocsandloads" ,
               [self gettimestampfromrealtimedata: mahstr ]   ,@"mahtimestamp" ,
               nil] ;
    
    
    
}




+ (char)schedulestringtonumber:(NSString *)strigot {
    
    
    if (  [kenstrfuncs isthisinthat: @"CANCELED" :  strigot  ] )
        return 0;
    
    
    return 1;
    return 2;
    return 3;
    
}



+ (NSString *)readfile:(NSString *)filetoread {
    
    return  [NSString stringWithContentsOfFile:filetoread]   ;
    
}






@end

