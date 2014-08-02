require 'split_video/version'

module SplitVideo

  USAGE = %{
    Usage: #{$0} [options] filename

    Options include:

      -s, --slices   : Number of pieces to slice the video into
      -d, --duration : Duration of each slice

    Important: only specify ONE of those!
  }

  def self.split_a_video(filename, options)
    unless (!! options['slices']) ^ (!! options['duration'])
      puts USAGE
      exit
    end

    if options['slices']
      SplitVideo.split_by_slices(filename, options['slices'].to_i, options)
    elsif options['duration']
      SplitVideo.split_by_duration(filename, options['duration'].to_i, options)
    end
  end

  def self.split_by_slices(filename, num_slices, options = {})
    seconds_per_slice = duration_in_seconds(filename) / num_slices

    offset = 0.0
    (0..(num_slices - 1)).each do |slice|
      offset += seconds_per_slice
      print "Cutting slice #{slice}"
      %x{
        ffmpeg -i      "#{filename}"            \
               -vcodec copy                     \
               -acodec copy                     \
               -ss     "#{offset}"              \
               -t      "#{seconds_per_slice}"   \
               #{output_filename_for(filename) % slice}
      }
      puts "...done!"
    end
  end

  def self.split_by_duration(filename, duration, options = {})
    puts "Sorry I haven't implemented this yet."
    exit
  end

  private

    def self.duration_in_seconds(filename)
      duration_string = %x{ffmpeg -i #{filename} 2>&1 | grep Duration}
      duration_string =~ /(\d{2}):(\d{2}):(\d{2}.\d{2})/
      hours, minutes, seconds = [$1, $2, $3].map(&:to_f)

      hours * 3600 + minutes * 60 + seconds
    end

    def self.output_filename_for(filename)
      filename.gsub %r{\A(.*)\.([^\.]+)\Z}, '\1-part-%04d.\2'
    end

end
