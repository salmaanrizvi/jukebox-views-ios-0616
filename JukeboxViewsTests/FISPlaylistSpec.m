//  FISPlaylistSpec.m

#import "Specta.h"
#define EXP_SHORTHAND
#import "Expecta.h"
#import "FISPlaylist.h"

SpecBegin(FISPlaylist)

describe(@"FISPlaylist", ^{
    
    __block FISPlaylist *defaultPlaylist;
    __block FISPlaylist *sortPlaylist;
    
    __block FISSong *holdOnBeStrong;
    __block FISSong *higherLove;
    __block FISSong *moMoney;
    __block FISSong *oldThingBack;
    __block FISSong *gangsta;
    __block FISSong *bailando;
    
    beforeAll(^{
        
        holdOnBeStrong = [[FISSong alloc] initWithTitle:@"Hold on Be Strong"
                                                 artist:@"Matoma vs Big Poppa"
                                                  album:@"The Internet 1"
                                               fileName:@"hold_on_be_strong" ];
        
        higherLove = [[FISSong alloc] initWithTitle:@"Higher Love"
                                             artist:@"Matoma ft. James Vincent McMorrow"
                                              album:@"The Internet 2"
                                           fileName:@"higher_love" ];
        
        moMoney = [[FISSong alloc] initWithTitle:@"Mo Money Mo Problems"
                                          artist:@"Matoma ft. The Notorious B.I.G."
                                           album:@"The Internet 3"
                                        fileName:@"mo_money_mo_problems" ];
        
        oldThingBack = [[FISSong alloc] initWithTitle:@"Old Thing Back"
                                               artist:@"The Notorious B.I.G."
                                                album:@"The Internet 4"
                                             fileName:@"old_thing_back" ];
        
        gangsta = [[FISSong alloc] initWithTitle:@"Gangsta Bleeding Love"
                                          artist:@"Matoma"
                                           album:@"The Internet 5"
                                        fileName:@"gangsta_bleeding_love" ];
        
        bailando = [[FISSong alloc] initWithTitle:@"Bailando"
                                           artist:@"Enrique Iglesias ft. Sean Paul"
                                            album:@"The Internet 6"
                                         fileName:@"bailando" ];
    });
    
    beforeEach(^{
        
        defaultPlaylist = [[FISPlaylist alloc] init];
        
        sortPlaylist = [[FISPlaylist alloc] init];
        sortPlaylist.songs = [ @[holdOnBeStrong, higherLove, moMoney, oldThingBack, gangsta, bailando] mutableCopy ];
        
    });
    
    describe(@"default initializer", ^{
        it(@"should generate six song objects held in the songs array", ^{
            expect(defaultPlaylist.songs.count).to.equal(6);
        });
    });
    
    describe(@"text", ^{
        it(@"should return a string representation of the playlist",^{
            NSString *text = @"1. (Title) Hold on Be Strong (Artist) Matoma vs Big Poppa (Album) The Internet 1\n2. (Title) Higher Love (Artist) Matoma ft. James Vincent McMorrow (Album) The Internet 2\n3. (Title) Mo Money Mo Problems (Artist) Matoma ft. The Notorious B.I.G. (Album) The Internet 3\n4. (Title) Old Thing Back (Artist) The Notorious B.I.G. (Album) The Internet 4\n5. (Title) Gangsta Bleeding Love (Artist) Matoma (Album) The Internet 5\n6. (Title) Bailando (Artist) Enrique Iglesias ft. Sean Paul (Album) The Internet 6\n";
            
            expect(defaultPlaylist.text).to.equal(text);
        });
    });
    
    describe(@"sortSongsByTitle", ^{
        it(@"should sort the songs array alphabetically by title, and secondarily by artist",^{
            [sortPlaylist sortSongsByTitle];
            
            expect(sortPlaylist.songs).to.equal(@[bailando, gangsta, higherLove, holdOnBeStrong, moMoney, oldThingBack]);
        });
        
        it(@"should set the text property to the new order", ^{
            NSString *text = @"1. (Title) Bailando (Artist) Enrique Iglesias ft. Sean Paul (Album) The Internet 6\n2. (Title) Gangsta Bleeding Love (Artist) Matoma (Album) The Internet 5\n3. (Title) Higher Love (Artist) Matoma ft. James Vincent McMorrow (Album) The Internet 2\n4. (Title) Hold on Be Strong (Artist) Matoma vs Big Poppa (Album) The Internet 1\n5. (Title) Mo Money Mo Problems (Artist) Matoma ft. The Notorious B.I.G. (Album) The Internet 3\n6. (Title) Old Thing Back (Artist) The Notorious B.I.G. (Album) The Internet 4\n";
            [sortPlaylist sortSongsByTitle];
            
            expect(sortPlaylist.text).to.equal(text);
        });
    });
    
    describe(@"sortSongsByArtist", ^{
        it(@"should sort the songs array alphabetically by artist, and secondarily by album",^{
            [sortPlaylist sortSongsByArtist];
            
            expect(sortPlaylist.songs).to.equal(@[bailando, gangsta, higherLove, moMoney, holdOnBeStrong, oldThingBack]);
        });
        
        it(@"should set the text property to the new order", ^{
            NSString *text = @"1. (Title) Bailando (Artist) Enrique Iglesias ft. Sean Paul (Album) The Internet 6\n2. (Title) Gangsta Bleeding Love (Artist) Matoma (Album) The Internet 5\n3. (Title) Higher Love (Artist) Matoma ft. James Vincent McMorrow (Album) The Internet 2\n4. (Title) Mo Money Mo Problems (Artist) Matoma ft. The Notorious B.I.G. (Album) The Internet 3\n5. (Title) Hold on Be Strong (Artist) Matoma vs Big Poppa (Album) The Internet 1\n6. (Title) Old Thing Back (Artist) The Notorious B.I.G. (Album) The Internet 4\n";
            [sortPlaylist sortSongsByArtist];
            
            expect(sortPlaylist.text).to.equal(text);
        });
    });
    
    describe(@"sortSongsByAlbum", ^{
        it(@"should sort the songs array alphabetically by album, and secondarily by title.",^{
            [sortPlaylist sortSongsByAlbum];
            
            expect(sortPlaylist.songs).to.equal(@[holdOnBeStrong, higherLove, moMoney, oldThingBack, gangsta, bailando]);
        });
        
        it(@"should set the text property to the new order", ^{
            NSString *text = @"1. (Title) Hold on Be Strong (Artist) Matoma vs Big Poppa (Album) The Internet 1\n2. (Title) Higher Love (Artist) Matoma ft. James Vincent McMorrow (Album) The Internet 2\n3. (Title) Mo Money Mo Problems (Artist) Matoma ft. The Notorious B.I.G. (Album) The Internet 3\n4. (Title) Old Thing Back (Artist) The Notorious B.I.G. (Album) The Internet 4\n5. (Title) Gangsta Bleeding Love (Artist) Matoma (Album) The Internet 5\n6. (Title) Bailando (Artist) Enrique Iglesias ft. Sean Paul (Album) The Internet 6\n";
            [sortPlaylist sortSongsByAlbum];
            
            expect(sortPlaylist.text).to.equal(text);
        });
    });
    
    describe(@"songForTrackNumber", ^{
        it(@"should return the song 'Jailbreak' when the third track is requested",^{
            expect([sortPlaylist songForTrackNumber:3]).to.equal(moMoney);
        });
        
        it(@"should return nil if an invalid position is entered",^{
            expect([sortPlaylist songForTrackNumber:0]).to.beNil();
            expect([sortPlaylist songForTrackNumber:7]).to.beNil();
        });
    });
    
});

SpecEnd
