//
//  FISPlaylist.m
//  JukeboxViews
//
//  Created by Salmaan Rizvi on 6/22/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISPlaylist.h"

@implementation FISPlaylist

-(instancetype)init {
    
    self = [super init];
    
    if (self) {
        _songs = [self generateSongObjects];
        _text = [self songsInText];
    }
    
    return self;
}

-(void) sortSongsByTitle {
    
    NSMutableArray *sortArray = self.songs;
    
    NSSortDescriptor *titleSort = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES];
    NSSortDescriptor *artistSort = [NSSortDescriptor sortDescriptorWithKey:@"artist" ascending:YES];
    [sortArray sortUsingDescriptors:@[titleSort, artistSort]];
    self.songs = sortArray;
    self.text = [self songsInText];
}

-(void) sortSongsByArtist {
    
    NSSortDescriptor *artistSort = [NSSortDescriptor sortDescriptorWithKey:@"artist" ascending:YES];
    NSSortDescriptor *albumSort = [NSSortDescriptor sortDescriptorWithKey:@"album" ascending:YES];
    [self.songs sortUsingDescriptors:@[artistSort, albumSort]];
    self.text = [self songsInText];
}

-(void) sortSongsByAlbum {
    
    NSSortDescriptor *albumSort = [NSSortDescriptor sortDescriptorWithKey:@"album" ascending:YES];
    NSSortDescriptor *titleSort = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES];
    [self.songs sortUsingDescriptors:@[albumSort, titleSort]];
    self.text = [self songsInText];
}

-(FISSong *) songForTrackNumber:(NSUInteger)songNumber {
    if(songNumber <= self.songs.count && songNumber > 0) {
        return self.songs[songNumber - 1];
    }
    else {
        return nil;
    }
}

- (NSMutableArray *)generateSongObjects
{
    NSMutableArray *songs = [[NSMutableArray alloc] init];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Hold on Be Strong"
                                             artist:@"Matoma vs Big Poppa"
                                              album:@"The Internet 1"
                                           fileName:@"hold_on_be_strong"] ];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Higher Love"
                                             artist:@"Matoma ft. James Vincent McMorrow"
                                              album:@"The Internet 2"
                                           fileName:@"higher_love"] ];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Mo Money Mo Problems"
                                             artist:@"Matoma ft. The Notorious B.I.G."
                                              album:@"The Internet 3"
                                           fileName:@"mo_money_mo_problems"] ];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Old Thing Back"
                                             artist:@"The Notorious B.I.G."
                                              album:@"The Internet 4"
                                           fileName:@"old_thing_back"] ];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Gangsta Bleeding Love"
                                             artist:@"Matoma"
                                              album:@"The Internet 5"
                                           fileName:@"gangsta_bleeding_love"] ];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Bailando"
                                             artist:@"Enrique Iglesias ft. Sean Paul"
                                              album:@"The Internet 6"
                                           fileName:@"bailando"] ];
    
    return songs;
}

-(NSString *)songsInText {
    NSMutableString *text = [@"" mutableCopy];
    
    for (NSUInteger i = 0; i < self.songs.count; i++) {
        [text appendFormat:@"%lu. %@\n", i+1, [self.songs[i] description]];
    }
    
    return text;
}

@end
