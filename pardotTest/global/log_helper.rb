class LogHelper
  LOG_ROOT = "C:\\ScoreBig\\Log\\"

  def self.after(log_file, after_regex)
    buffer = []

    File.open(LOG_ROOT + log_file + ".txt",   "r") do |f|

      is_after = false

      while line = f.gets
        if is_after
          buffer.push(line)
        end

        if after_regex.match(line)
          is_after = true
        end
      end

    end

    buffer
  end
end