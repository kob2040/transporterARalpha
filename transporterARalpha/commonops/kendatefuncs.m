//
//  kendatefuncs.m
//  Transporter
//
//  Created by ken tee on 7/1/19.
//  Copyright ©  2019 kob. All rights reserved.


#import "kendatefuncs.h"

@implementation kendatefuncs
 
 

 + (NSDate *)secondspast1970todate:(int)secondsigot   {
     return   [NSDate dateWithTimeIntervalSince1970:  secondsigot  ]    ;
 }
 
  


 +  ( int  ) datetodayofweek:(NSDate *)datetochek  {
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier: NSGregorianCalendar];
 
    return [[gregorian components:NSWeekdayCalendarUnit fromDate:datetochek]  weekday]  ;
     
}
 



 
+ (NSString *)datetodom :(NSDate *)datetocnv   {
    
    NSDateFormatter *dateFormatter =  [[NSDateFormatter alloc] init]  ;
   
    [dateFormatter setDateFormat:@"d"];
    
    return   [NSString stringWithFormat:@"%i", [[dateFormatter stringFromDate:datetocnv ] intValue]  ]    ;
    
}



+ (NSString *) datetomonthstr :(NSDate *)datetocnv   {
     ///"" "rd"   ""
    NSDateFormatter *dateFormatter =  [[NSDateFormatter alloc] init]  ;
    [dateFormatter setDateFormat:@"M" ];
    int monthtosrch  = [[dateFormatter stringFromDate:datetocnv] intValue];
    
    NSString * mth[] = {   @"zzzz" ,    @"Jan" ,    @"Feb"  ,  @"Mar" ,    @"Apr",@"May",@"Jun",@"Jul",@"Aug",@"Sep",@"Oct",@"Nov",@"Dec"};
    
    return mth[monthtosrch];
    
}

   + (int)convertdatetodayspastjan1st2019:(NSDate *)dateigotttt   {
    
    NSDate *myjan1st2019   =  [kendatefuncs getjan1st2019]  ;
    
 int daysdiff =  [self calcdaysdiffint:   myjan1st2019    :   dateigotttt   ];
    
    if ( daysdiff >= 0 )
        return daysdiff ;
   //   return  NULL    ;
    return 0   ;
    
}
 
 +  (int )secsdiffbetweendates:(NSDate *)newdate:(NSDate *)myfuturdate  {
   
         
      return 1 ;
      
      
      
  }



- (NSString *)calcdaysdiff:(NSDate *)newdate:(NSDate *)myfuturdate:(int)doabbrev  {
    
 // // // // // // // // // // // // // // // // // // // // //  // // NSLog( @"\n        BEGIN CCCCCCCCALC TIME DIFF  WITH DATES   **%@**  **%@**   \n  ",newdate  , myfuturdate   );
    
     //// myfuturdate  =  [kendatefuncs  addminstodate :myfuturdate  :  1  ];
    
    NSMutableString * calcremaintmpstring = [[NSMutableString alloc] init];
    /// [calcremaintmpstring appendString: @"\n" ];
    
    NSCalendar *rmngregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    unsigned int unitFlags = NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit ;
    
    NSDateComponents *mycomponentsdiffb = [rmngregorian components:unitFlags fromDate:newdate toDate:myfuturdate options:0];
    
    char minsdiff = [mycomponentsdiffb minute];
    char hoursdiff = [mycomponentsdiffb hour];
    char daysdiff = [mycomponentsdiffb day];
    
    //// fuk fuk fuk fuk fuk fuk fuk fuk fuk fuk
    
    ////// // // /////  // // // // // ////  // // // // // // // ////  // // // // ////  //  //  //  // // // // // // ////// // //// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //  //  //  //  // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // ////  // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //  // // // // // // // //////// // // // // // // // // // // // // // // // // // // // // // //// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //  // // NSLog( @"\n    mindiff %i  hrdiff %i  daydiff %i    \n  ",  minsdiff ,  hoursdiff ,  daysdiff    );
    //[rmngregorian release];
    //[mycomponentsdiffb release];
    // minsdiff+=1;
    
    
    if (daysdiff > 0   ) {
        //NSString *remdaysstr = [NSString stringWithFormat:@" %d day",  daysdiff   ]   ;
        ////// // // /////  // // // // // ////  // // // // // // // ////  // // // // ////  //  //  //  // // // // // // ////// // //// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //  //  //  //  // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // ////  // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //  // // // // // // // //////// // // // // // // // // // // // // // // // // // // // // // //// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //  // // NSLog( @"\n appendstring 22 \n"  );
        [calcremaintmpstring appendString: [NSString stringWithFormat:@" %dd",  daysdiff   ] ];
        
        ////// ///  [calcremaintmpstring appendString: [NSString stringWithFormat:@" %dd",  daysdiff   ] ];
        
    }
    if (hoursdiff > 0      ) {
        // NSString *remhrsstr = [NSString stringWithFormat:@" %d hr",  hoursdiff   ]   ;
        ////// // // /////  // // // // // ////  // // // // // // // ////  // // // // ////  //  //  //  // // // // // // ////// // //// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //  //  //  //  // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // ////  // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //  // // // // // // // //////// // // // // // // // // // // // // // // // // // // // // // //// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //  // // NSLog( @"\n appendstring 23 \n"  );
        [calcremaintmpstring appendString: [NSString stringWithFormat:@" %dh",  hoursdiff   ]  ];
    }
    if ( minsdiff  > 0    ) {
        //NSString *remminsstr = [NSString stringWithFormat:@" %d min",  minsdiff   ]   ;
        ////// // // /////  // // // // // ////  // // // // // // // ////  // // // // ////  //  //  //  // // // // // // ////// // //// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //// // //  // // // // // // // // // // // //// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //  // // NSLog( @"\n appendstring 24 \n"  );
        [calcremaintmpstring appendString:  [NSString stringWithFormat:@" %d minute",  minsdiff   ]   ];
        if ( minsdiff  >  1   )
            [calcremaintmpstring appendString:  @"s"   ];
        
    }
    
    //////   will only work for servives in lasthr  rewrittte
    
    
    if (   hoursdiff  <  0 ||  daysdiff  <  0   ||   minsdiff   <  0 ) {
      
         
         if (daysdiff<  0   )
         [calcremaintmpstring appendString: [NSString stringWithFormat:@" %d day",  (daysdiff*-1)   ] ];
         if (hoursdiff  < 0      )
         [calcremaintmpstring appendString: [NSString stringWithFormat:@" %d hr",  (hoursdiff*-1)   ]  ];
         if ( minsdiff <  0    )
         [calcremaintmpstring appendString:  [NSString stringWithFormat:@" %d min",   (minsdiff*-1)   ]   ];
         
         [calcremaintmpstring appendString: @" ago" ];
         
        
        return  calcremaintmpstring ;
        
    }    else {
        
        NSMutableString * uhfuture = [[NSMutableString alloc] init];
        [uhfuture appendString: @"" ];
        [uhfuture appendString: calcremaintmpstring ];
        
        
        if  (   daysdiff == 0 && hoursdiff == 0 && minsdiff == 0 )
            [uhfuture appendString: @" 1 min" ];
        
        return  uhfuture ;
        
    }
    
     
    
    return  calcremaintmpstring ;
    
    
}

 +  (int)calcminsdiffint:(NSDate *)newdate:(NSDate *)myfuturdate  {
      
     NSDateComponents *mycomponentsdiffb = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] components: NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit fromDate:newdate toDate:myfuturdate options:0];
     
    return  (    ([mycomponentsdiffb day]*24*60)  + ([mycomponentsdiffb hour]*60)  + [mycomponentsdiffb minute]  )  ;
  
     
 }
 


+  (NSString *) kendatedisplay:(NSDate *)datetocnv   {
    
    NSString * daysofweek[] = {    @"Sat" , @"Sun", @"Mon" , @"Tue",@"Wed",@"Thur",@"Fri" ,@"Sat",@"Sun" };
    
    NSMutableString * mymutablestr  = [[NSMutableString alloc] init];
    
    ///  int daysdiff = [self calctimediffint: [NSDate date]  :  datetocnv   ] /60/24   ;
    
    ////   int mintilltrakend  = [self calctimediffint: [NSDate date]  :   datetocnv    ]  ;
    
    ////   int hrstill  =  mintilltrakend/60   ;
    
    
    /////  int dayoweekon  =   [self datetodayofweek:  datetocnv   ]  ;
    
    //if (  hrstill  > 23 ) {
    [mymutablestr appendString:   daysofweek[ [self datetodayofweek:  datetocnv   ] ]    ];
    [mymutablestr appendString:    @" "   ];
    //  }
    // if (  daysdiff  >  5   ) {
    
    [mymutablestr appendString:   [self datetodom: datetocnv   ]    ];
    [mymutablestr appendString:    @" "   ];
    [mymutablestr appendString:   [self datetomonthstr: datetocnv   ]    ];
    [mymutablestr appendString:    @" "   ];
    
    // }
    
    [mymutablestr appendString:  [self  datetoshrtstr :datetocnv  ]     ];
    
    return  mymutablestr;
    
}




+  (NSString *)datetoshrtstr :(NSDate *)datetocnv   {
    
    NSDateFormatter *dateFormatter =  [[NSDateFormatter alloc] init]  ;
    
    [dateFormatter setDateFormat:@"mm"];
    int thesemin = [[dateFormatter stringFromDate:datetocnv] intValue];
    [dateFormatter setDateFormat:@"HH"];
    int thesehrs = [[dateFormatter stringFromDate:datetocnv] intValue];
    
    NSMutableString * mymutablestr  = [[NSMutableString alloc] init];
    BOOL  ampm = 0;
    if ( thesehrs  >= 12   )   {
        ampm = 1;
        if  ( thesehrs  >  12   )
            thesehrs -= 12;
    } if ( thesehrs   == 0    )   {
        thesehrs  = 12;
    }
    
    [mymutablestr appendString:   [NSString stringWithFormat:@"%i:", thesehrs  ]  ]   ;
    
    if ( thesemin < 10)
        [mymutablestr appendString:  @"0"    ];
    
    [mymutablestr appendString:   [NSString stringWithFormat:@"%i",  thesemin  ]  ]   ;
    
    
    if ( ampm == 1  )
        [mymutablestr appendString:  @"PM"    ];
    else
        [mymutablestr appendString:  @"AM"    ];
    
    return mymutablestr;
    
    
}



+ (int)kendatetomonthint:(NSDate *)datetocnv {  
 
     NSDateFormatter *dateFormatter =    [[NSDateFormatter alloc] init] ;
     [dateFormatter setDateFormat:@"M" ];
    
  
      return  [[dateFormatter stringFromDate:datetocnv ] intValue];  ; 
    
 }

 + (int)kendatetoyearint:(NSDate *)datetocnv {  
 
     NSDateFormatter *dateFormatter =    [[NSDateFormatter alloc] init] ;
      [dateFormatter setDateFormat:@"yyyy"]; 
     return  [[dateFormatter stringFromDate:datetocnv ] intValue];  ; 
      
 }
  
 
+ (NSDate *)intstodate:(int )year:(int)mth:(int )dom {
    
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    
    [comps  setDay:   dom   ];
    [comps  setMonth: mth   ];
    [comps setYear:  year  ];
    
    return  [[[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian]  dateFromComponents:comps];
    
}



+ (NSDate *)kenstrtodate:(NSString *)datestr  {
    
    ////////////////////////printf("\n convdate with[ month:  %i dom: %i  year: %i  hour: %i min: %i sec: %i ]", month, dayofmonth, year, hour, min, seconds    );
 
    NSArray *lines = [datestr componentsSeparatedByString:@"|"];
    
    
    if (  [lines  count] <  3 ) {
        return NULL;
    }
    
    
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    
    ///  if (  [lines count] > 5 ) {
    
    /*
     [comps  setHour:   [[lines objectAtIndex:0 ] intValue] ];
    [comps  setMinute: [[lines objectAtIndex:1 ] intValue]];
    [comps  setSecond: [[lines objectAtIndex:2 ] intValue] ];
     */
    
    
    [comps  setDay:  [[lines objectAtIndex:0 ] intValue] ];
    [comps  setMonth:  [[lines objectAtIndex:1 ] intValue] ];
    [comps setYear:  [[lines objectAtIndex:2  ] intValue]];
    
    
    return  [[[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian]  dateFromComponents:comps];
  
}

 
 
+ (NSDate *)kenstrtodateb:(NSString *)datestr  {
    
    ////////////////////////printf("\n convdate with[ month:  %i dom: %i  year: %i  hour: %i min: %i sec: %i ]", month, dayofmonth, year, hour, min, seconds    );
 
    NSArray *lines = [datestr componentsSeparatedByString:@"|"];
    
    
    if (  [lines  count] <  3 ) {
        return NULL;
    }
    
    
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    
    ///  if (  [lines count] > 5 ) {
  
     [comps  setHour:    [[lines objectAtIndex:0 ] intValue]    ];
     [comps  setMinute:    [[lines objectAtIndex:1 ] intValue]    ];
     [comps  setSecond:   0    ];
     
     
    [comps  setDay:  [[lines objectAtIndex:2 ] intValue] ];
    [comps  setMonth:  [[lines objectAtIndex:3 ] intValue] ];
    [comps setYear:  [[lines objectAtIndex:4 ] intValue]];
    
    
    return  [[[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian]  dateFromComponents:comps];
  
}

   

  
+ (NSString *)kendatetostrwithhrmin:(NSDate *)datetocnv {
    
  // // // // // // // // // // // // // // // //// // // // // // // // // // // // // // // // // // // // // // // // NSLog(@"\n  ##   beg datetostr with date  [%@]   #####  \n " ,   datetocnv        );
    
    NSDateFormatter *dateFormatter =    [[NSDateFormatter alloc] init] ;
    [dateFormatter setDateFormat:@"M" ];
    int monthtosrch  = [[dateFormatter stringFromDate:datetocnv] intValue];
    [dateFormatter setDateFormat:@"mm"];
    int mintosrch = [[dateFormatter stringFromDate:datetocnv] intValue];
    [dateFormatter setDateFormat:@"HH"];
    int hrtosrch = [[dateFormatter stringFromDate:datetocnv] intValue];
    [dateFormatter setDateFormat:@"d"];
    int dayofmonthtosrch = [[dateFormatter stringFromDate:datetocnv ] intValue];
    
     // // // // // //////// // // // // // // // // // // // // // // // // // // // // // //// // // // // // // // // // // // // // // // // // // // // // // // NSLog(@"\n  dayofmonthtosrch ## %i ###" ,  dayofmonthtosrch  );
    
    [dateFormatter setDateFormat:@"yyyy"];
    int year = [[dateFormatter stringFromDate:datetocnv ] intValue];
  
    NSString *mydatestr  =    [NSString stringWithFormat:@"%i|%i|%i|%i|%i" ,
                               hrtosrch,
                               mintosrch,
                               dayofmonthtosrch ,
                               monthtosrch,
                               year
                               ]  ;
    
    // // // // //// // // // // // // // // // // // // // // // // // // // // // // // NSLog(@"\n  ##  converted date  [%@] tostr [%@]   #####  \n " ,   datetocnv  ,  mydatestr       );
    
    return (mydatestr) ;
    
}

  
+ (NSString *)kendatetostr:(NSDate *)datetocnv {
    
  // // // // // // // // // // // // // // // //// // // // // // // // // // // // // // // // // // // // // // // // NSLog(@"\n  ##   beg datetostr with date  [%@]   #####  \n " ,   datetocnv        );
    
    NSDateFormatter *dateFormatter =    [[NSDateFormatter alloc] init] ;
    [dateFormatter setDateFormat:@"M" ];
    int monthtosrch  = [[dateFormatter stringFromDate:datetocnv] intValue];
    [dateFormatter setDateFormat:@"mm"];
    int mintosrch = [[dateFormatter stringFromDate:datetocnv] intValue];
    [dateFormatter setDateFormat:@"HH"];
    int hrtosrch = [[dateFormatter stringFromDate:datetocnv] intValue];
    [dateFormatter setDateFormat:@"d"];
    int dayofmonthtosrch = [[dateFormatter stringFromDate:datetocnv ] intValue];
    
     // // // // // //////// // // // // // // // // // // // // // // // // // // // // // //// // // // // // // // // // // // // // // // // // // // // // // // NSLog(@"\n  dayofmonthtosrch ## %i ###" ,  dayofmonthtosrch  );
    
    [dateFormatter setDateFormat:@"yyyy"];
    int year = [[dateFormatter stringFromDate:datetocnv ] intValue];
  
    NSString *mydatestr  =    [NSString stringWithFormat:@"%i|%i|%i" ,
                               dayofmonthtosrch ,
                               monthtosrch,
                               year
                               ]  ;
    
    // // // // //// // // // // // // // // // // // // // // // // // // // // // // // NSLog(@"\n  ##  converted date  [%@] tostr [%@]   #####  \n " ,   datetocnv  ,  mydatestr       );
    
    return (mydatestr) ;
    
}



+ (   NSDate*  ) sethrminsecondate:(NSDate *)datetochek:(int)hrtoset:(int)mintoset:(int)sectoset   {
     
     NSDateComponents *comps = [[NSDateComponents alloc] init];
     [comps setMinute: mintoset ];
     [comps setHour: hrtoset ];
      [comps setSecond:  sectoset  ];
     
     [comps setYear: [self getyearint: datetochek ]   ];
     [comps setMonth:    [self getmonth: datetochek  ]       ];
     [comps setDay:    [self getdayomonthint:   datetochek   ]     ];
      
      
     NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
     NSDate*  result = [gregorian dateFromComponents:comps];
   
     return  result ;
    
    
}




+ (BOOL )testkendateearlier:(NSDate *)datea:(NSDate *)dateb  {
    
    if ([datea laterDate:dateb] == dateb)  {
        return 1 ;
        
    }
    
    return 0 ;
    
    
}
 



+ (NSDate *)getjan2nd2019    {
    
    NSDate* result;
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setMinute:0];
    [comps setHour:0];
    [comps setYear:2019];
    [comps setMonth:  1];
    [comps setDay:2];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    result = [gregorian dateFromComponents:comps];
    
    // NSLog( @"\n  #####  getjan2nd2019 result[%@]  ####### \n "  ,  result   );
    
    
    return  result ;
    
}

+ (NSDate *)getjan2nd1159pm2019    {
    
    NSDate* result;
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setMinute:59];
    [comps setHour:23];
    [comps setYear:2019];
    [comps setMonth:  1];
    [comps setDay:2];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    result = [gregorian dateFromComponents:comps];
    
    // NSLog( @"\n  #####  getjan2nd1159pm2019 result[%@]  ####### \n "  ,  result   );
    
    return  result ;
    
}



+ ( int  ) datetoobcdow:(NSDate *)datetochek  {
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier: NSGregorianCalendar];
    
    NSDateComponents *weekdayComponents = [gregorian components:NSWeekdayCalendarUnit fromDate:datetochek];
    
    return [weekdayComponents weekday]  ;
    /// return dayofweektosrch  ;
    
}


+ (NSString *)dowinttostr:(int)dowint  {
    
    NSString * daysofweek[] = {    @"Sat" , @"Sun", @"Mon" , @"Tue",@"Wed",@"Thur",@"Fri" ,@"Sat",@"Sun"  };
    
    if ( dowint < 9 )
        return daysofweek[dowint];
    
    return @"";
    
}



+ (NSString *)kendatetostrdisplay2019:(NSDate *)datetocnv:(BOOL)showdayofweek:(BOOL)showtwenfrhrtime:(BOOL)showdayofmonth:(BOOL)showmonth:(BOOL)showyear:(BOOL)linebreaks {
    
    NSMutableString * mutestr   = [[NSMutableString alloc] init];
    NSDateFormatter *dateFormatter =    [[NSDateFormatter alloc] init] ;
    
    
    if ( showdayofweek ) {
        
        //// int thisdow =  [self datetodayofweek:  datetocnv   ];
        int thisdow =  [self datetoobcdow: datetocnv   ];
        [mutestr appendString: [self dowinttostr :  thisdow    ]     ]  ;
        if ( linebreaks )
            [mutestr appendString:   @"\n"   ];
        else
            [mutestr appendString:   @" "   ];
        
    }
    
    if (  showtwenfrhrtime  ) {
        [mutestr appendString:   [NSString stringWithFormat:@"%@" ,  [self datetoshrtstr :  datetocnv   ]   ]  ]  ;
        if ( linebreaks )
            [mutestr appendString:   @"\n"   ];
        else
            [mutestr appendString:   @" "   ];
        
    }
    
    if ( showdayofmonth ) {
        [dateFormatter setDateFormat:@"d"];
        [mutestr appendString:   [dateFormatter stringFromDate:datetocnv ]  ]  ;
        if ( linebreaks )
            [mutestr appendString:   @"\n"   ];
     ///    else
        //      [mutestr appendString:   @" "   ];
        
        
    }
     // NSLog( @"\n  #####  ahud i show month   ####### \n "  );
    
    if ( showmonth  ) {
        
        // NSLog( @"\n  #####   yas you  show month   ####### \n "  );
        
        int begmonthint =  [self kendatetomonthint:  datetocnv   ]   ;
        
        // NSLog( @"\n  #####   yas you  show month   ####### \n "  );
        
        [mutestr appendString:  [NSString stringWithFormat:@"/%i",  begmonthint  ]  ];
        
                 /*
        [mutestr appendString:  [self monthnumtoname:  begmonthint  ] ]  ;
        // [mymutablestr appendString:   [NSString stringWithFormat:@"%i:",  begmonthint  ]  ]   ;
 
        
        [mutestr appendString:  [NSString stringWithFormat:@"/%i",  begmonthint  ]  ];
         
        if ( linebreaks )
            [mutestr appendString:   @"\n"   ];
        else
            [mutestr appendString:   @" "   ];
        
           */
        
        
    }
    
    if ( showyear ) {
        [dateFormatter setDateFormat:@"yyyy"];
        [mutestr appendString:   [dateFormatter stringFromDate:datetocnv ]  ]  ;
        if ( linebreaks )
            [mutestr appendString:   @"\n"   ];
        else
            [mutestr appendString:   @" "   ];
    }
    
    
    
    
    return mutestr ;
    
    
    
}




+  (NSString *)monthnumtoname:(int)datestr  {
    NSString * delStations[] =    {   @"January",   @"January", @"February" ,  @"March", @"April",@"May",@"June",@"July",@"August",@"September",@"October",@"November",@"December" ,  @"January"   };
    
    if ( datestr  <   13   )
        return    delStations[datestr]   ;
    else
        return @"";
    
    
}







+ (NSDate *)getjan10th2019    {
    
    NSDate* result;
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setMinute:0];
    [comps setHour:0];
    [comps setYear:2019];
    [comps setMonth:  1];
    [comps setDay:10];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    result = [gregorian dateFromComponents:comps];
    
    // NSLog( @"\n  ##### getjan10th2019 result[%@]  ####### \n "  ,  result   );
    
    return  result ;
    
}


+ (NSDate *)getjan1st2019    {
      
    NSDate* result;
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setMinute:0];
    [comps setHour:0];
    [comps setYear:2019];
    [comps setMonth:  1];
    [comps setDay:1];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    result = [gregorian dateFromComponents:comps];
    
    // NSLog( @"\n  #####  result[%@]  ####### \n "  ,  result   );
    
    
    return  result ;
    
}



+ (int)calcdaysdiffint:(NSDate *)newdate:(NSDate *)myfuturdate  {
    
    // // // // // // // // // // // // // // // // // // // // // // //// // // // // // // // // // // // // // // // // // // // // // // NSLog( @"\n   BEG CALC DAYSZ  \n  "    );
    if (   newdate != nil &&   myfuturdate!= nil  ) {
        
        
        NSCalendar *rmngregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        
        unsigned int unitFlags =  NSDayCalendarUnit   ;
        
        NSDateComponents *mycomponentsdiffb = [rmngregorian components:unitFlags fromDate:newdate toDate:myfuturdate options:0];
        
        //     char minsdiff = [mycomponentsdiffb minute];
        //     char hoursdiff = [mycomponentsdiffb hour];
        int daysdiff = [mycomponentsdiffb day];
        
        // // // // // // // // // // // // // // // // // // // // // // //// // // // // // // // //
        
        
 // NSLog( @"\n days diff between earlier date [%@] later date [%@] is [%i] \n  " ,newdate  , myfuturdate  ,  daysdiff   );
        
        return     (daysdiff     )  ;
        
    }
    return 0 ;
    
}


+ (NSDate *)addminutestodate:(NSDate *)tmpdate:(int)minutestoadd {
    
    NSTimeInterval secondsPerMin = (60)*minutestoadd;
    /// NSDate *tomorrow = [tmpdate dateByAddingTimeInterval:secondsPerDay];
    
    NSDate *dateimreturnin   =     [tmpdate dateByAddingTimeInterval:secondsPerMin];
    
    
    return dateimreturnin ;
    
    
    
}


+ (NSDate *)adddaystodate:(NSDate *)tmpdate:(int)daytoadd {
    
    NSTimeInterval secondsPerDay = (86400)*daytoadd;
    /// NSDate *tomorrow = [tmpdate dateByAddingTimeInterval:secondsPerDay];
    
    NSDate *dateimreturnin   =     [tmpdate dateByAddingTimeInterval:secondsPerDay];
    
    
    // NSLog( @"\n ##### date [%@] with [%i] days added is [%@]  ####### \n "  ,  tmpdate , daytoadd  ,  dateimreturnin     );
    
    return dateimreturnin ;
    
    
    
}

+ (int)getmonth:(NSDate *)datetocnv {
    
    // // // // // ////// // //// // // // // //
    NSDateFormatter *dateFormatter =   [[NSDateFormatter alloc] init]  ;
    [dateFormatter setDateFormat:@"M" ];
    return  [[dateFormatter stringFromDate:datetocnv] intValue];
    /////  return monthtosrch;
    
}

+ (int)getyearint:(NSDate *)datetocnv {
    
    
    NSDateFormatter *dateFormatter =  [[NSDateFormatter alloc] init]  ;
    [dateFormatter setDateFormat:@"yyyy"];
    
    return  [[dateFormatter stringFromDate:datetocnv ] intValue]  ;
    
    
}


+ (int)getdayomonthint:(NSDate *)datetocnv {
    
    NSDateFormatter *dateFormatter =  [[NSDateFormatter alloc] init]  ;
    [dateFormatter setDateFormat:@"d"];
     return   [[dateFormatter stringFromDate:datetocnv ]intValue] ;
    
}


+ (NSDate *)sethrminofdate:(NSDate *)dateigot:(int)hourstoset:(int)minstoset {
    
    int thismonth = [self getmonth : dateigot ] ;
    int thisyear =   [self getyearint : dateigot ] ;
    int thisdom =  [self getdayomonthint : dateigot ] ;
    
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    
    [comps  setDay:  thisdom  ];
    [comps  setMonth:  thismonth  ];
    [comps setYear:  thisyear ];
    
    [comps  setHour:   hourstoset   ];
    [comps  setMinute:  minstoset  ];
    [comps  setSecond:   0    ];
    
    NSDate *convrtddate = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar]  dateFromComponents:comps];
    
    return convrtddate ;
    
}











@end

