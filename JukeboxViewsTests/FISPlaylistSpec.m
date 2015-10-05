//  FISPlaylistSpec.m

#import "Specta.h"
#import "FISPlaylist.h"
#define EXP_SHORTHAND
#import "Expecta.h"


SpecBegin(FISPlaylist)

describe(@"FISPlaylist", ^{
    
    __block FISPlaylist *playlist;
    __block FISSong *song1;
    __block FISSong *song2;
    __block FISSong *song3;
    __block FISSong *song4;
    
    beforeAll(^{
        playlist = [[FISPlaylist alloc] init];
        song1 = [[FISSong alloc] initWithTitle:@"Dancing in the Moonlight" artist:@"Thin Lizzy" album:@"Bad Reputation" fileName:@"thin_lizzy_dancing.mp3"];
        
        song2 = [[FISSong alloc] initWithTitle:@"Dancing in the Moonlight" artist:@"King Harvest" album:@"Dancing in the Moonlight" fileName:@"king_harvest_dancing.mp3"];
        
        song3 = [[FISSong alloc] init];
        song3.artist = @"Thin Lizzy";
        song3.title = @"Jailbreak";
        song3.album = @"Jailbreak";
        song3.fileName = @"jailbreak.mp3";
        song4 = [[FISSong alloc] initWithTitle:@"Cowboy Song" artist:@"Thin Lizzy" album:@"Jailbreak" fileName:@"cowboy_song.mp3"];
        
    });
    
    beforeEach(^{
        
        playlist.songs = [NSMutableArray arrayWithObjects:song1, song2, song3, song4, nil];
        
    });
    
    describe(@"songs", ^{
        it(@"returns an NSMutableArray",^{
            expect(playlist.songs).to.beKindOf([NSMutableArray class]);
            expect(playlist.songs).to.respondTo(@selector(addObject:));
        });
        
        it(@"can have songs added",^{
            FISPlaylist *newPlaylist = [[FISPlaylist alloc] init];
            [newPlaylist.songs addObjectsFromArray: @[song1, song2, song3]];
            expect(newPlaylist.songs).to.equal(@[song1, song2, song3]);
        });
    });
    
    describe(@"sortSongsByTitle", ^{
        it(@"Should sort the songs array alphabetically ascending by title. If two songs have the same title, then they should be sorted alphabetically ascending by artist.",^{
            [playlist sortSongsByTitle];
            expect(playlist.songs).to.equal(@[song4, song2, song1, song3]);
        });
    });
    
    describe(@"sortSongsByArtist", ^{
        it(@"Should sort the songs array alphabetically ascending by artist. If two songs have the same Artist, then they should be sorted alphabetically ascending by album",^{
            [playlist sortSongsByArtist];
            expect(playlist.songs).to.equal(@[song2, song1, song4, song3]);
        });
    });
    
    describe(@"sortSongsByAlbum", ^{
        it(@"Should sort the songs array alphabetically ascending by Album. If two songs have the same album, then they should be sorted alphabetically ascending by title.",^{
            [playlist sortSongsByAlbum];
            expect(playlist.songs).to.equal(@[song1, song2, song4, song3]);
        });
    });
    
    describe(@"description", ^{
        it(@"should return an NSString representation of the playlist. Remember \n can be used for new line.",^{
            expect([playlist description]).to.equal(@"1. Title: Dancing in the Moonlight Artist: Thin Lizzy Album: Bad Reputation\n2. Title: Dancing in the Moonlight Artist: King Harvest Album: Dancing in the Moonlight\n3. Title: Jailbreak Artist: Thin Lizzy Album: Jailbreak\n4. Title: Cowboy Song Artist: Thin Lizzy Album: Jailbreak\n");
        });
    });
    
    describe(@"songAtPosition", ^{
        it(@"should return the song at the position given. This should not start from 0, it should start at 1 because we are humans!",^{
            expect([playlist songForTrackNumber:3]).to.equal(song3);
        });
        
        it(@"should return nil if an invalid position is entered",^{
            expect([playlist songForTrackNumber:0]).to.beNil();
        });
    });
    
});

SpecEnd
