//
//  stopinfo.h
//  AVCam
//
//  Created by ken tee on 25/4/21.
//  Copyright © 2021 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "tripinfo.h"


NS_ASSUME_NONNULL_BEGIN

@interface stopinfo : NSObject
  
 
 
@property (readwrite) NSString * stopname;

@property (readwrite) int stopid  ;
 
@property (readwrite) int platformnum  ;
  

@property (readwrite) int currentangletouser  ;
  


@property (readwrite) float longitude ;
@property (readwrite) float latitude  ;
 

@property (readwrite) int drawx  ;
@property (readwrite) int drawy  ;
   
@property (readwrite) BOOL currentlyvisible  ;
 @property (readwrite) BOOL leftofview   ;


@property (readwrite) NSMutableArray *  myservs ;
  
 
- (id) keninit :(NSString *)name  ;
 ////  - (id) keninit :(NSString *)name:(int)wherex:(int)wherey  ;


- (id) keninit :(NSString *)name:(float)lontoset:(float)lattoset ;

- ( NSString * ) tostring  ;

   


@end

NS_ASSUME_NONNULL_END
