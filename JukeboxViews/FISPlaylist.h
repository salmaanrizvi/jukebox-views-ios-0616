//
//  Playlist.h
//  JukeboxViews
//
//  Created by Chris Gonzales on 8/21/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISSong.h"

@interface FISPlaylist : NSObject

@property (strong, nonatomic) NSMutableArray *songs;

-(void)sortSongsByTitle;
-(void)sortSongsByArtist;
-(void)sortSongsByAlbum;
-(NSString *)description;
-(FISSong *)songForTrackNumber:(NSUInteger)trackNumber;

@end
