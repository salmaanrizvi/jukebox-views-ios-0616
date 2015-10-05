//  FISSongSpec.m

#import "Specta.h"
#import "FISSong.h"
#define EXP_SHORTHAND
#import "Expecta.h"


SpecBegin(FISSong)


describe(@"FISSong", ^{
    
    __block FISSong *song;
    
    beforeAll(^{
        song = [[FISSong alloc] initWithTitle:@"Hold on Be Strong" artist:@"Matoma vs Big Poppa" album:@"The Internet 1" fileName:@"hold_on_be_strong"];
    });
    
    describe(@"designated initializer", ^{
        it(@"shoult be a valid object",^{
            expect(song).toNot.beNil();
        });
        
        it(@"should have non-empty string values for properties",^{
            expect(song.title).toNot.equal(@"");
            expect(song.artist).toNot.equal(@"");
            expect(song.album).toNot.equal(@"");
            expect(song.fileName).toNot.equal(@"");
        });
    });
    
    describe(@"default initializer", ^{
        __block FISSong *defaultSong;
        
        beforeAll(^{
            defaultSong = [[FISSong alloc] init];
        });
        
        it(@"should be a valid object",^{
            expect(defaultSong).toNot.beNil();
        });
        
        it(@"should have properties with empty strings for all values",^{
            expect(defaultSong.title).to.equal(@"");
            expect(defaultSong.artist).to.equal(@"");
            expect(defaultSong.album).to.equal(@"");
            expect(defaultSong.fileName).to.equal(@"");
        });
    });
    
    describe(@"title", ^{
        it(@"returns an NSString",^{
            expect(song.title).to.beKindOf([NSString class]);
        });
        
        it(@"can be set",^{
            song.title = @"Brown Eyed Girl";
            expect(song.title).to.equal(@"Brown Eyed Girl");
        });
    });
    
    describe(@"artist", ^{
        it(@"returns an NSString",^{
            expect(song.artist).to.beKindOf([NSString class]);
        });
        
        it(@"can be set",^{
            song.artist = @"Van Morrison";
            expect(song.artist).to.equal(@"Van Morrison");
        });
    });
    
    describe(@"album", ^{
        it(@"returns an NSString",^{
            expect(song.album).to.beKindOf([NSString class]);
        });
        
        it(@"can be set",^{
            song.album = @"Greatest Hits";
            expect(song.album).to.equal(@"Greatest Hits");
        });
    });
    
    describe(@"fileName", ^{
        it(@"returns an NSString",^{
            expect(song.fileName).to.beKindOf([NSString class]);
        });
        
        it(@"can be set",^{
            song.fileName = @"brown_eyed_girl.mp3";
            expect(song.fileName).to.equal(@"brown_eyed_girl.mp3");
        });
    });
});

SpecEnd
