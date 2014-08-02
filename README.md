# SplitVideo

Simple executables for splitting an transcoding videos.

## Installation

Add this line to your application's Gemfile:

    gem 'split_video'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install split_video

## Usage

    $ vsplit --slices 10 --file my_awesome_but_super_long_video.m4v

...will split the video file `my_awesome_but_super_long_video.m4v` into 10
slices named like `my_awesome_but_super_long_video-part-0001.m4v`.  That's it!

## Contributing

1. Fork it ( http://github.com/<my-github-username>/split_video/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
