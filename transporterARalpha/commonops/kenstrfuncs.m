//
//  kenstrfuncs.m
//  Transporter
//
//  Created by ken tee on 7/1/19.
//  Copyright © 2019 kob. All rights reserved.
//

#import "kenstrfuncs.h"

@implementation kenstrfuncs


+ (void) writefileappendfast:(NSString*)content:(NSString*)fileName:(BOOL)append {
    content = [NSString stringWithFormat:@"%@",content];
    
    
/*
  //get the documents directory:
    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *fileName = [documentsDirectory stringByAppendingPathComponent:@"hydraLog.txt"];
*/ 
 
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForWritingAtPath:fileName];
    if (fileHandle){
        
        [fileHandle seekToEndOfFile];
        [fileHandle writeData:[content dataUsingEncoding:NSUTF8StringEncoding]];
        [fileHandle closeFile];
    }
    else{
        [content writeToFile:fileName
                  atomically:NO
                    encoding:NSStringEncodingConversionAllowLossy
                       error:nil]; 
                       
                       
                       
    } 
    
    
}
 



+ (BOOL) stringcompare:(NSString*)stra:(NSString*)strb {
         
    
  ///// NSLog( @"\n  #####   stringcompare   stra [%@]   strb [%@]   ####### \n "  , stra  ,  strb  );
    return [stra isEqualToString: strb];
       
    
    
}



+ (NSString*) limitstringlength:(NSString*)stringigot:(int)maxlength:(NSString*)stringtoappendiftoolong   {
    
    
 if ( [stringigot length]  >  maxlength ) {
       
 NSMutableString * tmpstring  = [[NSMutableString alloc] init];
        
   [tmpstring  appendString:  [stringigot substringWithRange: NSMakeRange (  0  , maxlength  )]       ];
   [tmpstring  appendString:  stringtoappendiftoolong   ];
      
    }
    
    return  stringigot ;
    
}



+ (int) stringlength:(NSString*)string  {
    
    return [string length] ;
     
  }
    
    

+ (NSString *)removespacesfrombeginningandofstring:(NSString *)mahstr  {
    
    
    return  [mahstr stringByTrimmingCharactersInSet:
                               [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
    
    return mahstr  ;
    
}
 
+ (NSString *)stringtolowercase:(NSString *)mahstr  { 

   return  [mahstr lowercaseString];  
    
}
 
+ (NSString *)capitaliseword:(NSString *)mahstr  {
   
    if (  mahstr.length  <   2   )
    return mahstr ;
    
    
    NSString *mahlower  = [mahstr lowercaseString]  ;
        
    NSString * capitalisedSentence = [mahlower stringByReplacingCharactersInRange:NSMakeRange(0,1)
    withString:[[mahlower substringToIndex:1] capitalizedString]];
    
    return   capitalisedSentence   ;
     
}


+ (NSString *)capitalisestring:(NSString *)mahstr  {
  
 NSArray *linesz =  [mahstr componentsSeparatedByString:@" "];
    
 NSMutableString * mymutey  = [[NSMutableString alloc] init];
        
    for  (  int x = 0  ;   x   <  [linesz count ]   ;  x++  ) {
         
        [mymutey appendString:  [self capitaliseword: [linesz objectAtIndex:  x  ]]  ] ;
         
        if (  x <   [linesz count ] -1  )
            [mymutey appendString:  @" "];
        
        
    }
     
       return mymutey ;
    
}



  /*
+ (NSString *)nsrecttostring:(NSRect *)frame {
    
 return @"";
   
    int myx = frame.origin.x  ;
    int myy = frame.origin.y ;
    int mywidth = ;
    int myheight = ;
   
    return @"";
     
    return [NSString stringWithFormat:@"%i,%i,%i,%i", frame.origin.x , frame.origin.y  , frame.size.width  ,  frame.size.height   ]  ;
   
}
    */


+ (NSString *)kenstrreplace:(NSString *)igot:(NSString *)whattorep:(NSString *)repwith  {
    
    NSString *str = [igot stringByReplacingOccurrencesOfString:whattorep
                                                    withString:repwith];
    
    return str;
    
} 


      
  
  
+ (BOOL )matchatleasthalfofwords:(NSString *)pathofailfx:(NSString *)tom  {
     
     
    NSArray *linesf = [pathofailfx componentsSeparatedByString:@" "];
    NSArray *linesgf = [tom componentsSeparatedByString:@" "];
    
    
    int lengthostr = [linesf count]  ;
    int lengthostrb = [linesgf count]  ;
    
    int nummtched  = 0  ;
    for (NSString * line in linesf)
    {
        if   ( [self isthisinthat_case_optional:  line    : tom   : YES   ] == 1 ) {
            nummtched++;
        }
         
        
     
       }
    
   
    
    if (  nummtched > (lengthostr/2)   )
        return 1;
    
    if (  nummtched >= (lengthostrb)   )
        return 1;
    
    return 0;
    
    
    
    
}


  
  
 + (BOOL)isthisinthat_case_optional:(NSString *)stringa:(NSString *)stringb:(BOOL)ignorecasebool {
      
    NSString *stringaa   =   [NSString stringWithFormat:@"%@" , stringa     ] ;
    NSString *stringbb   =   [NSString stringWithFormat:@"%@" ,  stringb    ] ;
      
     if ( ignorecasebool ) {
       
 stringaa   =    [self stringtolowercase :  stringaa   ]  ;
 stringbb   =    [self stringtolowercase :  stringbb  ]  ; 
       
     }
      
    if  (   ! ( [stringbb rangeOfString: stringaa].location == NSNotFound)   ) {
        return  YES  ;
    }
    
    
    
    return NO  ;
    
} 
 
 
 
+ (BOOL)isthisinthat:(NSString *)stringa:(NSString *)stringb {
    
    NSString *stringaa   =   [NSString stringWithFormat:@"%@" , stringa     ] ;
    NSString *stringbb   =   [NSString stringWithFormat:@"%@" ,  stringb    ] ;
    
    if  (   ! ( [stringbb rangeOfString: stringaa].location == NSNotFound)   ) {
        return  YES  ;
    }
    
    
    
    return NO  ;
    
}





@end
