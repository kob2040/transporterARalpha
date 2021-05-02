//
//  tripinfo.h
//  AVCam
//
//  Created by ken tee on 26/4/21.
//  Copyright © 2021 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface tripinfo : NSObject
 




@property (readwrite) NSString * tripid;
@property (readwrite) NSString * destinationstr;


@property (readwrite) NSDate * depdate;

@property (readwrite) int remainmins ;

@property (readwrite) int rtlatemins  ;
  
- (id) keninit :(NSString *)idtoset:(NSString *)deststrtoset:(int)mintoset ;


- ( NSString * ) tostring  ;



@end

NS_ASSUME_NONNULL_END
