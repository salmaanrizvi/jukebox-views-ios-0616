# Jukebox Views

## Objectives

1. Use custom data classes in a view controller.
2. Use `IBAction`s to trigger methods on view controllers, and `IBOutlets` to set labels with output strings.
3. Use the `AVAudioPlayer` class to play audio files.

## Introduction

In this lab, you're going to hook up some audio files to a view controller that will allow a user to select a song from a list and playback the associated audio track. First, you're going to set up the data models for holding the information at run time. Then, you'll connect the data models to a view controller than will make the songs interactive to the user.

## Instructions

### The Data Models

There are two classes that you will need to set up according to the provided test files, `FISSong` and `FISPlaylist`. The `FISSong` class is simply a data model for holding title, artist, album, and filename information for an mp3 file. The `FISPlaylist` class contains an array of songs, and will need to be set up with some methods for sorting and accessing the information in that array.

#### `FISSong`

1. Create the class files for `FISSong`. It should inherit from `NSObject` and contain four string properties called `title`, `artist`, `album`, and `fileName`.

2. Declare a designated initializer that covers these four properties in that order.

3. Override the default initializer to call the designated initializer with empty strings submitted as all four arguments. Verify that the tests for `FISSong` pass before moving on.

#### `FISPlaylist`

1 — Create the class files for `FISPlaylist`. It should inherit from `NSObject` and contain two properties, a mutable array called `songs` and a string called `text`. Declare the following methods:
  * `sortSongsByTitle` which provides no return,
  * `sortSongsByArtist`, which provides no return,
  * `sortSongsByAlbum`, which provides no return, and
  * `songForTrackNumber:` which takes one `NSUInteger` argument and returns a `FISSong` object.  
  Define the methods to default implementations and run the tests.
  
2 — Override the default initializer. It should set the `songs` array to the result of the following `generateSongObjects method below (we'll save you some typing):

```objc
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
```

3 — Write some code that sets up the `text` property. Think about where this belongs -- you'll need to call it after the `songs` array is initialized. It should format the information in each song in the `songs` arrays to match the following format:

```
1. (Title) Hold on Be Strong (Artist) Matoma vs Big Poppa (Album) The Internet 1\n
```

Don't forget the newline character at the end of the line.

4 — Write the implementations for the sorting methods. Each method should reorder the songs in the `songs` array and update the string in the `text` property.

  * `sortSongsByTitle` should sort the songs array alphabetically ascending by title, and secondarily by artist.
  * `sortSongsByArtist` should sort the songs array alphabetically ascending by artist, and secondarily by album.
  * `sortSongsByAlbum` should sort the songs array alphabetically ascending by album, and secondarily by title.

5 — Write the implementation for `songAtTrackNumber:`. It should return the song from the `songs` array at the correct track number (which begins at `1`, unlike indexes). If the argument is not a valid track number, this method should return `nil`.

All the tests for `FISPlaylist` should now pass.


### The Storyboard

The storyboard file contains an empty view controller. Add and connect two `UIButtons` that will "play" and "stop" an audio file, a `UITextField` for collecting a song number from the user, and a `UITextView` for displaying the playlist's contents to the user. You might lay them out something like this:

![](https://curriculum-content.s3.amazonaws.com/ios-inheritance-unit/jukebox_storyboard.png)

### Create the View Controller Class

1. Create a subclass of `UIViewController` called `FISJukeboxViewController`.

2. Add a `FISPlaylist` property called `playlist`. Connect the text field and text view properties to the class file, and connect the "play" and "stop" buttons to actions.

3. In the `viewDidLoad` method (*after a call to `[super viewDidLoad]`*), set the `playlist` property to a default instance of `FISPlaylist`. Set the textview's `text` property to the `playlist`'s text property.

4. The basic flow of the app is the user can put in a number in the `UITextField` that corresponds to a song in the song listing and then hit play and that song will be played. For the first version of the app, just `NSLog()` the information of the song to be played.

5. Now add three more `UIButton`s to the view controller's canvas in the storyboard file. They should be title `Title`, `Artist`, and `Album`. Connect them to the view controller's class file. They should tell the `playlist` property to sort its songs according the respective method. Don't forget to update the text view after the order of the songs is changed!

### Incorporate the Audio Player

Once the `NSLog()`s are working, you can set up an audio player to actually play the music! There are a few steps needed to get audio working:

  1. Import the `AVFoundation` library by writing `#import <AVFoundation/AVFoundation.h>` in your view controller.
  2. Add an `AVAudioPlayer` property called `audioPlayer`.
  3. Copy this method into the view controller's implementation:

  ```objc
  - (void)setUpAVAudioPlayerWithFileName:(NSString *)fileName
  {
      NSURL *url = [[NSBundle mainBundle] URLForResource:fileName withExtension:@"mp3"];
      NSError *error = nil;
      self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
      if (!self.audioPlayer)
      {
          NSLog(@"Error in audioPlayer: %@",
                [error localizedDescription]);
      } else {
          [self.audioPlayer prepareToPlay];
      }
  }
  ```

  4. Rewrite the implementation for the "Play" button's IBAction. Use the `songForTrackNumber:` method get the song object for a digit entered by the user in the text field. To prepare a song to be played, call `setUpAVAudioPlayerWithFileName:` with the song's `fileName`. Then, to actually pay the song, call the `audioPlayer`'s `play` method.
  
  5. Now write the implementation for the "Stop" button's IBAction to call the `stop` method on the `self.audioPlayer` object.

  6. Run your jukebox in the simulator. Select a song to play and listen to your sound system churn out a sweet tune! (**Top-tip:** *Make sure your volume is on, but at a moderate level.*)
