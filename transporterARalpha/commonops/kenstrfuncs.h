//
//  kenstrfuncs.h
//  Transporter
//
//  Created by ken tee on 7/1/19.
//  Copyright © 2019 kob. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface kenstrfuncs : NSObject

+ (BOOL)isthisinthat:(NSString *)stringa:(NSString *)stringb ;

+ (NSString *)kenstrreplace:(NSString *)igot:(NSString *)whattorep:(NSString *)repwith  ;

+ (NSString *)removespacesfrombeginningandofstring:(NSString *)mahstr   ;

+ (NSString *)stringtolowercase:(NSString *)mahstr ;

+ (void) writefileappendfast:(NSString*)content:(NSString*)fileName:(BOOL)append ;

+ (NSString*) limitstringlength:(NSString*)stringigot:(int)maxlength:(NSString*)stringtoappendiftoolong  ;

 + (BOOL)isthisinthat_case_optional:(NSString *)stringa:(NSString *)stringb:(BOOL)ignorecasebool  ;
 
 + (BOOL )matchatleasthalfofwords:(NSString *)pathofailfx:(NSString *)tom ;
 
+ (NSString *)capitalisestring:(NSString *)mahstr  ;

 + (BOOL) stringcompare:(NSString*)stra:(NSString*)strb ;
    

@end
