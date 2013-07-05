//
//  JSONModel.h
//  BUBusPredictor3
//
//  Created by Ray Swartz on 7/5/13.
//  Copyright (c) 2013 Boston University. All rights reserved.
//

//
//  Superclass for JSON data models
//

#import <Foundation/Foundation.h>

@interface JSONModel : NSObject <NSCoding, NSCopying, NSMutableCopying> {
    
}

-(id) initWithDictionary:(NSMutableDictionary*) jsonObject;

@end
