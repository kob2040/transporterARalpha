//
//  kendatefuncs.h
//  Transporter
//
//  Created by ken tee on 7/1/19.
//  Copyright © 2019 kob. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface kendatefuncs : NSObject
 
+  (int )secsdiffbetweendates:(NSDate *)newdate:(NSDate *)myfuturdate  ;
 

+ (NSDate *)intstodate:(int )year:(int)mth:(int )dom  ;

+  (NSString *)calcdaysdiff:(NSDate *)newdate:(NSDate *)myfuturdate:(int)doabbrev  ;

+  ( int  ) datetodayofweek:(NSDate *)datetochek  ;
+ (NSString *)dowinttostr:(int)dowint  ;
 

+ (   NSDate*  ) sethrminsecondate:(NSDate *)datetochek:(int)hrtoset:(int)mintoset:(int)sectoset   ;

 
    

+ (NSString *)kendatetostrdisplay2019:(NSDate *)datetocnv:(BOOL)showdayofweek:(BOOL)showtwenfrhrtime:(BOOL)showdayofmonth:(BOOL)showmonth:(BOOL)showyear:(BOOL)linebreaks ;

+ (NSDate *)secondspast1970todate:(int)secondsigot ;

+  (NSString *) kendatedisplay:(NSDate *)datetocnv ;
     
+ (NSDate *)kenstrtodate:(NSString *)datestr  ;

 + (int)convertdatetodayspastjan1st2019:(NSDate *)dateigotttt ;
       
+ (NSString *)kendatetostr:(NSDate *)datetocnv ;


+ (NSString *)kendatetostrwithhrmin:(NSDate *)datetocnv ;

+  (int)calcminsdiffint:(NSDate *)newdate:(NSDate *)myfuturdate  ;
 
+ (NSDate *)kenstrtodateb:(NSString *)datestr  ;

     
+ (BOOL )testkendateearlier:(NSDate *)datea:(NSDate *)dateb ;

+ (NSDate *)adddaystodate:(NSDate *)tmpdate:(int)daytoadd ;

+ (NSDate *)addminutestodate:(NSDate *)tmpdate:(int)minutestoadd  ;

+ (NSDate *)sethrminofdate:(NSDate *)dateigot:(int)hourstoset:(int)minstoset ;

+ ( int  ) datetodayofweek:(NSDate *)datetochek ;

+ (int)calcdaysdiffint:(NSDate *)newdate:(NSDate *)myfuturdate  ;

+ (NSDate *)getjan1st2019  ;

+ (NSDate *)getjan2nd2019  ;

+ (NSDate *)getjan2nd1159pm2019  ;

+ (NSDate *)getjan10th2019  ;

 





@end
 
