//
//  Realtimedatamodule.h
//  Transporter
//
//  Created by ken tee on 11/2/19.
//  Copyright © 2019 kob. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Realtimedatamodule : NSObject

//// + (NSDictionary * )parserealtimedatastr:(NSString *)mahstr  ;


 ///// + (NSDictionary * )parserealtimedatastr:(NSString *)mahstr:(NSMutableArray *)routeidsiwant  ;

+ (NSDictionary * )parserealtimedatastr:(NSString *)mahstr:(NSMutableArray *)routeidsiwant:(int)typeodataimparsing ;


+ (NSDictionary *)getminslatethesestopids:(int)depstopid:(int)deststopid:(NSDictionary *)realtimedict ;

+ (NSDictionary * )getrealtimedata:(NSString *)menetwork ;

+ (int)getminuteslateforthisrealtimedict:(NSDictionary *)realtimedict  ;

+ (NSString * )getcurlstrforthisnetwork:(NSString *)mahtablename ;
+ (NSMutableArray * )getrealtimedatamultifeed:(NSMutableArray *)tablesmatched:(NSMutableArray *)loadedtables  ;

+ (NSDictionary * ) parserealtimealertstr:( NSString * )mystr:( NSString * )lasttimestamp ;


    

@end
