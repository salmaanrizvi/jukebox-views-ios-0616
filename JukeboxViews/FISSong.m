//  FISSong.m

#import "FISSong.h"

@implementation FISSong

- (instancetype)initWithTitle:(NSString *)title
                       artist:(NSString *)artist
                        album:(NSString *)album
                     fileName:(NSString *)fileName
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
    return [self initWithTitle:@"" artist:@"" album:@"" fileName:@""];
}
@end

