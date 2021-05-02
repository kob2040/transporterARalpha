//
//  myuiview.h
//  AVCam
//
//  Created by ken tee on 25/4/21.
//  Copyright © 2021 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface myuiview : UIView {
     
    IBOutlet UITextField *debuglabel;
    
}
 
- (void )setupstuff   ;


- (IBAction)sliderValueChanged:(UISlider *)sender ;

 
- (void)setmyposition:(float)lon:(float)lat ;


- (IBAction)setmyangle:(id)sender ;

  


@end

NS_ASSUME_NONNULL_END
