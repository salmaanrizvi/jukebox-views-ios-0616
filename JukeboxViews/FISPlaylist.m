//  FISPlaylist.m

#import "FISPlaylist.h"

@implementation FISPlaylist

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        _songs = [self generateSongObjects];
    }
    
    return self;
}

-(NSMutableArray *)generateSongObjects
{
//    the funky part of the if statement below checks to see if we're testing or just running the program. this should actually be put into a preprocessor macro
    
    NSMutableArray *songs = [[NSMutableArray alloc] init];
    
    if (self.songs.count == 0 && ![[[NSProcessInfo processInfo] environment] objectForKey:@"XCInjectBundle"]) {
        
        [songs addObject:[[FISSong alloc] initWithTitle:@"Hold on Be Strong" artist:@"Matoma vs Big Poppa" album:@"The Internet 1" fileName:@"hold_on_be_strong"] ];
        [songs addObject:[[FISSong alloc] initWithTitle:@"Higher Love" artist:@"Matoma ft. James Vincent McMorrow" album:@"The Internet 2" fileName:@"higher_love"] ];
        [songs addObject:[[FISSong alloc] initWithTitle:@"Mo Money Mo Problems" artist:@"Matoma ft. The Notorious B.I.G." album:@"The Internet 3" fileName:@"mo_money_mo_problems"] ];
        [songs addObject:[[FISSong alloc] initWithTitle:@"Old Thing Back" artist:@"The Notorious B.I.G." album:@"The Internet 4" fileName:@"old_thing_back"] ];
        [songs addObject:[[FISSong alloc] initWithTitle:@"Gangsta Bleeding Love" artist:@"Matoma" album:@"The Internet 5" fileName:@"gangsta_bleeding_love"] ];
        [songs addObject:[[FISSong alloc] initWithTitle:@"Bailando" artist:@"Enrique Iglesias ft. Sean Paul" album:@"The Internet 6" fileName:@"bailando"] ];
    }
    
    return songs;
}

-(NSString *)description
{
    
    NSMutableString *formattedString = [[NSMutableString alloc] init];
    
    for (NSUInteger i = 0; i < self.songs.count; i++) {
        FISSong *song = self.songs[i];
        [formattedString appendFormat:@"%lu. Title: %@ Artist: %@ Album: %@\n", i+1, song.title, song.artist, song.album];
    }
    return formattedString;
}

-(void)sortSongsByTitle
{
    NSSortDescriptor *sortByTitleAsc = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:YES];
    NSSortDescriptor *sortByArtistAsc = [[NSSortDescriptor alloc] initWithKey:@"artist" ascending:YES];
    
    NSArray *descriptors = @[sortByTitleAsc, sortByArtistAsc];
    NSArray *sortedSongs = [self.songs sortedArrayUsingDescriptors:descriptors];
    
    self.songs = [[NSMutableArray alloc] initWithArray:sortedSongs];
    
}

-(void)sortSongsByArtist
{
    NSSortDescriptor *sortByArtistAsc = [[NSSortDescriptor alloc] initWithKey:@"artist" ascending:YES];
    NSSortDescriptor *sortByAlbumAsc = [[NSSortDescriptor alloc] initWithKey:@"album" ascending:YES];
    NSSortDescriptor *sortByTitleAsc = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:YES];
    
    NSArray *descriptors = @[sortByArtistAsc, sortByAlbumAsc, sortByTitleAsc];
    NSArray *sortedSongs = [self.songs sortedArrayUsingDescriptors:descriptors];
    
    self.songs = [[NSMutableArray alloc] initWithArray:sortedSongs];
}

-(void)sortSongsByAlbum
{
    NSSortDescriptor *sortByAlbumAsc = [[NSSortDescriptor alloc] initWithKey:@"album" ascending:YES];
    NSSortDescriptor *sortByTitleAsc = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:YES];
    
    NSArray *descriptors = @[sortByAlbumAsc, sortByTitleAsc];
    NSArray *sortedSongs = [self.songs sortedArrayUsingDescriptors:descriptors];
    
    self.songs = [[NSMutableArray alloc] initWithArray:sortedSongs];
}

-(FISSong *)songForTrackNumber:(NSUInteger)trackNumber
{
    BOOL validTrackNumber = trackNumber != 0 && trackNumber <= self.songs.count;
    if (validTrackNumber) {
        return self.songs[trackNumber-1];
    }
    return nil;
}

@end
