//
//  Song.h
//  JukeboxViews
//
//  Created by Chris Gonzales on 8/21/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISSong : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *artist;
@property (strong, nonatomic) NSString *album;
@property (strong, nonatomic) NSString *fileName;

-(instancetype)initWithTitle:(NSString *)title artist:(NSString *)artist album:(NSString *)album andFileName:(NSString *)fileName;
@end
