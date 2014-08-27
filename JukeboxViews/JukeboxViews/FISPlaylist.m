//
//  Playlist.m
//  JukeboxViews
//
//  Created by Chris Gonzales on 8/21/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISPlaylist.h"

@implementation FISPlaylist

-(NSMutableArray *)songs
{
    if (!_songs) {
        
        FISSong *song1 = [[FISSong alloc] initWithTitle:@"Hold on Be Strong" artist:@"Matoma vs Big Poppa" album:@"The Internet 1" andFileName:@"hold_on_be_strong"];
        FISSong *song2 = [[FISSong alloc] initWithTitle:@"Higher Love" artist:@"Matoma ft. James Vincent McMorrow" album:@"The Internet 2" andFileName:@"higher_love"];
        FISSong *song3 = [[FISSong alloc] initWithTitle:@"Mo Money Mo Problems" artist:@"Matoma ft. The Notorious B.I.G." album:@"The Internet 3" andFileName:@"mo_money_mo_problems"];
        FISSong *song4 = [[FISSong alloc] initWithTitle:@"Old Thing Back" artist:@"The Notorious B.I.G." album:@"The Internet 4" andFileName:@"old_thing_back"];
        FISSong *song5 = [[FISSong alloc] initWithTitle:@"Gangsta Bleeding Love" artist:@"Matoma" album:@"The Internet 5" andFileName:@"gangsta_bleeding_love"];
        FISSong *song6 = [[FISSong alloc] initWithTitle:@"Bailando" artist:@"Enrique Iglesias ft. Sean Paul" album:@"The Internet 6" andFileName:@"bailando"];
        
        _songs = [[NSMutableArray alloc] initWithArray:@[song1, song2, song3, song4, song5, song6]];
    }
    
    return _songs;
}

-(NSString *)description
{
    
    NSMutableString *formattedString = [[NSMutableString alloc] init];
    
    for (int count = 0; count < self.songs.count; count++) {
        FISSong *song = self.songs[count];
        [formattedString appendFormat:@"%i. Title: %@ Artist: %@ Album: %@\n", count+1, song.title, song.artist, song.album];
    }
    return formattedString;
}

-(void)sortSongsByTitle
{
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:YES];
    NSArray *descriptors = @[descriptor];
    self.songs = [[NSMutableArray alloc] initWithArray:[self.songs sortedArrayUsingDescriptors:descriptors]];
    
}

-(void)sortSongsByArtist
{
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"artist" ascending:YES];
    NSArray *descriptors = @[descriptor];
    self.songs = [[NSMutableArray alloc] initWithArray:[self.songs sortedArrayUsingDescriptors:descriptors]];
}

-(void)sortSongsByAlbum
{
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"album" ascending:YES];
    NSArray *descriptors = @[descriptor];
    self.songs = [[NSMutableArray alloc] initWithArray:[self.songs sortedArrayUsingDescriptors:descriptors]];
}

-(FISSong *)songAtPosition:(NSNumber *)position
{
    NSInteger songNumber = [position integerValue];
    BOOL isValid = songNumber > 0 && songNumber <= self.songs.count;
    if (isValid) {
        return self.songs[songNumber-1];
    }
    return nil;
}

@end
