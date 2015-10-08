//  FISSongSpec.m

#import "Specta.h"
#import "FISSong.h"
#define EXP_SHORTHAND
#import "Expecta.h"


SpecBegin(FISSong)


describe(@"FISSong", ^{
    
    __block FISSong *defaultSong;
    __block FISSong *holdOnBeStrong;
    
    beforeEach(^{
        defaultSong = [[FISSong alloc] init];
        holdOnBeStrong = [[FISSong alloc] initWithTitle:@"Hold on Be Strong"
                                                 artist:@"Matoma vs Big Poppa"
                                                  album:@"The Internet 1"
                                               fileName:@"hold_on_be_strong"];
    });

    describe(@"default initializer", ^{
        it(@"should set all properties to empty strings",^{
            expect(defaultSong.title).to.equal(@"");
            expect(defaultSong.artist).to.equal(@"");
            expect(defaultSong.album).to.equal(@"");
            expect(defaultSong.fileName).to.equal(@"");
        });
    });
    
    describe(@"designated initializer", ^{
        it(@"should set properties to argument values",^{
            expect(holdOnBeStrong.title).to.equal(@"Hold on Be Strong");
            expect(holdOnBeStrong.artist).to.equal(@"Matoma vs Big Poppa");
            expect(holdOnBeStrong.album).to.equal(@"The Internet 1");
            expect(holdOnBeStrong.fileName).to.equal(@"hold_on_be_strong");
        });
    });
});

SpecEnd
