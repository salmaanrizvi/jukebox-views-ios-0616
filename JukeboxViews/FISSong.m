//
//  FISSong.m
//  JukeboxViews
//
//  Created by Salmaan Rizvi on 6/22/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISSong.h"

@implementation FISSong

-(instancetype)init {
    return [self initWithTitle:@"" artist:@"" album:@"" fileName:@""];
}

-(instancetype)initWithTitle:(NSString *)title artist:(NSString *)artist album:(NSString *)album fileName:(NSString *)fileName {
    
    self = [super init];
    
    if ( self) {
        _title = title;
        _artist = artist;
        _album = album;
        _fileName = fileName;
    }
    
    return self;
}

-(NSString *)description {
    return [NSString stringWithFormat:@"(Title) %@ (Artist) %@ (Album) %@", self.title, self.artist, self.album];
}

@end
