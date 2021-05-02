//
//  myuiview.m
//  AVCam
//
//  Created by ken tee on 25/4/21.
//  Copyright © 2021 Apple. All rights reserved.
//

#import "myuiview.h"
#import "stopinfo.h"

#import "prefshelper.h"
#import "locationmath.h"
 

#define degreesToRadians(x) (M_PI * x / 180.0)


 
@implementation myuiview



int myangle = 55;
int myfieldofview = 90 ;


float mylon = -33.772841 ;
float mylat =  151.082177  ;
 

///  int wheretodrawx = 100  ;

int fieldofview = 100  ;
  





NSMutableArray *mystops ;

 

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
 

- (void)viewDidLoad {
    
      
   NSLog(@"\n ##   viewDidLoad viewDidLoad  ###"      );
        
    [self setupstuff];
    
 
    
   /// [super viewDidLoad];

    // init your parameters here
    
    
    
}
 

 
- (void)debugdegrees
{
    
    
    for ( int x = -180 ; x <  540  ; x+= 20  ) {
        
  int myradians = degreesToRadians(x );
 NSLog(@"  #  degree  [%i]  radian    [%i] "    ,   x  ,  myradians    );
        
        
    }
    
    
    
}


- (id)initWithFrame:(CGRect)frame
{
    
    NSLog(@"\n ##   initWithFrame   ###"      );
          
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
 


- (id)initWithDelegate:(id)_delegate
{
      
    NSLog(@"\n ##  initWithDelegate    ###"      );
         
       
     
    /*
    self = [[[[NSBundle mainBundle] loadNibNamed:@"YourView" owner:self options:nil] objectAtIndex:0] retain];
    if (self) {
        [super init];

        self.delegate = _delegate;

        // init your parameters here

        return self;

    }
    return nil;
     */
    
    
 return nil;
    
    
    
}


- (void )setupstuff   {
       
 NSLog(@"  setupstuff   "    );
      
 mystops = [prefshelper getmystns];
       
  [self setstopsangles];
  [self setNeedsDisplay];
 [self debugdegrees];
       
}


- (void)setstopsangles  {
      
       
    for (  int x = 0 ; x < [mystops count]  ; x++   ) {
          
 stopinfo *thisstopinfo =  [mystops objectAtIndex: x]  ;
           
 thisstopinfo.currentangletouser =    [locationmath locationtoangle:
                                       thisstopinfo.longitude   :
                                        thisstopinfo.latitude   :
                                          mylon       :
                                            mylat   ];
         
        
    }
    
    
}



- (IBAction)sliderValueChanged:(UISlider *)sender {
    
 NSLog(@"slider value = %f", sender.value);
    
  ////  float myvalfloat = ;
    
 [self  setmyanglefunc:  360 -   sender.value  ];
    
    
}


- (void)setmyanglefunc:(int)valigot  {
    
    myangle =  valigot ;
     
   /// wheretodrawx = valigot  ;
      
    
    [self calcmypositons];
    
    
    [self setNeedsDisplay];
     
    
}
 

 



- (IBAction)setmyangle:(id)sender  {
    
    
    // // // ////
    
     
    NSLog(@"   setmyangleeeeeeeeeeeeee  "  );
      
  /// NSLog(@"   setmyangleeeeeeeeeeeeee  int [%i]  "  ,  [ [sender value] intValue]     );
    
      ////  NSLog(@"   setmyangleeeeeeeeeeeeee   "  );
     /////    myangle =    [sender intValue]  ;
    
    
}
 
- ( int  )whereinfieldofview:(int)angleigot {
  
    //// 0 visible
     ///  1 screeen left
    ///  2 screem right
     
    int minangle1 =   myangle - myfieldofview  ;
    int maxangle1 =  myangle  +  myfieldofview    ;
   
   int minangle2 =    -1   ;
   int maxangle2 =   -1    ;
   
    if (minangle1 < 0 ) {
    
  maxangle2 = 360 ;
 minangle2 =   360 +  minangle1     ;
        
        
  minangle1 =  0;
        
    }
    
 if ( maxangle1 > 360  ) {
        
     minangle2 =   0     ;
     maxangle2 =  maxangle1 - 360    ;
     
     maxangle1 = 360 ;
    
  }
    
    
     if (  angleigot <  maxangle1 &&   angleigot >   minangle1     )
     return  0 ;
      
    if (     angleigot  <   minangle1     )
     return   2 ;
      
    if (   angleigot >   maxangle1    )
     return    1  ;
       
    if ( minangle2 != -1 && maxangle2 != -1   ) {
        
        if (     angleigot  <   minangle2     )
         return   2  ;
          
        if (   angleigot >   maxangle2   )
         return    1   ;
         
    }
    
    
     
     return  0 ;
    
}



- (void )calcmypositons {
    
 
 for ( int x = 0 ; x <   [mystops count]  ; x++ ) {
           
stopinfo * thistop  =  [mystops objectAtIndex: x ] ;
            
 int whereonfieldofview  =  [self whereinfieldofview:   thistop.currentangletouser    ]   ;
   
 CGFloat mainViewWidth = self.bounds.size.width -70 ;
      
     if (   whereonfieldofview   == 0   ) {
          ///  thistop.drawx =  myangle   ;
         
       thistop.drawx = (myangle) - thistop.currentangletouser +90   ;
         
         thistop.currentlyvisible = YES  ;
         
     } else {
          
         thistop.currentlyvisible =  NO  ;
           
     if (   whereonfieldofview   ==  1  )  {
            thistop.drawx =   0    ;
           thistop.leftofview = YES     ;
          
      } else {
            thistop.drawx =  mainViewWidth   ;
              thistop.leftofview =  NO      ;
          
     }
         
     }
     
     
   
         thistop.drawy =  55 ;
        
    }
    
    
    
}


 

- (void)setmyposition:(float)lon:(float)lat {
     
     
    
    
    
}

 - (void)setanglelabel:(int)myangle {
   
     NSString *mahstr   =   [NSString stringWithFormat:@"%i",  myangle   ]   ;
           
     
    ///    [];
     
     
     
 }
 

 /*
  
 
- (void)drawRect:(CGRect)rect {
      
     
      for ( int x = 0 ;  x < [mystops count]   ; x++ ) {
      
    stopinfo *thisstop =  [mystops objectAtIndex: x] ;
          
          
          
          
          
      }
     
 UIFont* font = [UIFont fontWithName:@"Arial" size:24];
 UIColor* textColor = [UIColor redColor];
    
 NSDictionary* stringAttrs = @{ NSFontAttributeName : font, NSForegroundColorAttributeName : textColor };

 NSAttributedString* attrStr = [[NSAttributedString alloc] initWithString:@"Hello\nabdfdbfdb\ngfbfgbfg" attributes:stringAttrs];

 [attrStr drawAtPoint:CGPointMake(10.f, 10.f)];
      
    
}
  */


- ( NSString *)getdebugstr  {
    
   ///  return  [];
    
   return  [NSString stringWithFormat:@"lon[%f]\nlat[%f]\ncurrent angle - [%i]",  mylon   , mylat  , myangle  ]  ;
 
    return @"debugasttr";
     
    
}

- (int )getrectheightthisstr:(NSString *)mahstr {
   
 NSArray *linesz =  [mahstr  componentsSeparatedByString:@"\n"];
     
   return (    ( [linesz count] *20  )  );
       
    
    
}

- (void)drawRectfff:(CGRect)rect {
      
    
    
 //// CGRect rectangle = CGRectMake(  55    ,  50  +(x*60)    , rectwidth   ,  myrectheight );
         
    /*
     
     CGRect rect1 = self.frame;
      rect1.origin.x = 0;
      rect1.origin.y = 0;

      UIImageView *dot =[[UIImageView alloc] initWithFrame:CGRectMake(rect1.origin.x,rect1.origin.y,rect1.size.width,rect1.size.height)];
      dot.image = [UIImage imageNamed:@"miter"];
      [self addSubview:dot];

      OverlayView *overlay = [[OverlayView alloc] initWithFrame:CGRectMake(rect1.origin.x,rect1.origin.y,rect1.size.width,rect1.size.height)];
      [overlay setBackgroundColor:[UIColor clearColor]];

      [self addSubview:overlay];
      [self bringSubviewToFront:overlay];
     
     
     */
    
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
      CGContextAddEllipseInRect(ctx, rect);
      CGContextSetFillColor(ctx, CGColorGetComponents([[UIColor redColor] CGColor]));
      CGContextFillPath(ctx);
       
    
    
    
}

- (void)drawRecttttt:(CGRect)rect {
  
 
    
    
    
}

- (void)drawRect:(CGRect)rect {
  
     /*
      
      
      CGContextRef ctx = UIGraphicsGetCurrentContext();
        CGContextAddEllipseInRect(ctx, rect);
        CGContextSetFillColor(ctx, CGColorGetComponents([[UIColor blueColor] CGColor]));
        CGContextFillPath(ctx);
      
      
      */
    
    
    
 NSLog(@"    drawrect   "  ); 
 CGRect imgrectangle = CGRectMake( myangle -360  ,   self.bounds.size.height/2 +(self.bounds.size.height/5 )  , self.bounds.size.width  * 2 , self.bounds.size.height/2   );
 UIImage *img = [UIImage imageNamed:@"stitcha.jpeg"];
    
    
  [img drawInRect:imgrectangle];
        
    
    for ( int x = 0 ;  x < [mystops count]   ; x++ ) {
    
  stopinfo *thisstop =  [mystops objectAtIndex: x] ;
        
    ///     thisstop.drawx , 50  +(x*60)
         
        
 int rectwidth =  180 ;
  if (  ! thisstop.currentlyvisible  )
 rectwidth =  40  ;
     
        
  int myrectheight    =  [self getrectheightthisstr :    [thisstop tostring]    ]    ;
         
  CGRect rectangle = CGRectMake( thisstop.drawx     ,  50  +(x*60)    , rectwidth   ,  myrectheight );
                
 if ( thisstop.currentlyvisible ) {
       
 
  CGContextRef context = UIGraphicsGetCurrentContext();
     
  CGContextSetRGBFillColor(context, 1,  0 , 0 , 1.0);   //this is the transparent color
    
     CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 0.5);
     
  // CGContextSetRGBFillColor(context, 1.0, 1.0, 1.0, 0.0);   //this is the transparent color
       /// CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 0.5);
     
  CGContextFillRect(context, rectangle);
   CGContextStrokeRect(context, rectangle);    //this will draw the border
        
        ////////
        }   else {
            
   //// draw circle
                   
 CGRect rectangleb = CGRectMake( thisstop.drawx     ,  30  +(x*60)    , rectwidth*2    ,  myrectheight*4   );
                
 CGContextRef ctx = UIGraphicsGetCurrentContext();
             
  CGContextAddEllipseInRect(ctx, rectangleb);
  CGContextSetFillColor(ctx, CGColorGetComponents([[UIColor redColor] CGColor]));
 CGContextFillPath(ctx);
                 
            
            
        }
        
        
        
        
         
            
        UIFont* font = [UIFont fontWithName:@"Arial" size:16];
        UIColor* textColor = [UIColor whiteColor];
        ///  UIColor* textColor = [UIColor redColor];
        NSDictionary* stringAttrs = @{ NSFontAttributeName : font, NSForegroundColorAttributeName : textColor };

        NSAttributedString* attrStr = [[NSAttributedString alloc] initWithString:[thisstop tostring]  attributes:stringAttrs];

        [attrStr drawAtPoint:CGPointMake( thisstop.drawx , 50  +(x*60)  )];
        
       
        
    } 
    
    
 
        
    UIFont* font = [UIFont fontWithName:@"Arial" size:16];
    UIColor* textColor = [UIColor whiteColor];
    ///  UIColor* textColor = [UIColor redColor];
    NSDictionary* stringAttrs = @{ NSFontAttributeName : font, NSForegroundColorAttributeName : textColor };

    NSAttributedString* attrStr = [[NSAttributedString alloc] initWithString: [self getdebugstr]    attributes:stringAttrs];
 
  
    
    [attrStr drawAtPoint:CGPointMake(  0  ,  self.bounds.size.height -70    )];
     
    
    
    
}






@end
