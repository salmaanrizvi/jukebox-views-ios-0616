//
//  Song.m
//  JukeboxViews
//
//  Created by Chris Gonzales on 8/21/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISSong.h"

@implementation FISSong

- (instancetype)initWithTitle:(NSString *)title artist:(NSString *)artist album:(NSString *)album andFileName:(NSString *)fileName
{
    self = [super init];
    if (self) {
        _title = title;
        _artist = artist;
        _album = album;
        _fileName = fileName;
    }
    return self;
}

-(instancetype)init
{
    return [self initWithTitle:@"" artist:@"" album:@"" andFileName:@""];
}
@end

