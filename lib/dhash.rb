require 'RMagick'

class DHash

  def self.hash_from_blob(blob, hash_size = 8)
    image = Magick::Image.from_blob(blob).first
    hash_from_image(image, hash_size)
  end

  def self.hash_from_path(path, hash_size = 8)
    image = Magick::Image.read(path).first
    hash_from_image(image, hash_size)
  end

  def self.hash_from_image(image, hash_size = 8)
    image = image.quantize(256, Magick::RGBColorspace, Magick::NoDitherMethod, 8).resize!(hash_size + 1, hash_size + 1)

    count = 0
    result = 0
    hash_size.times do |row|
      hash_size.times do |col|
        pixels_left = image.pixel_color(col, row).marshal_dump
        grey_left = (pixels_left[:red] + pixels_left[:green] + pixels_left[:blue]) / 3

        pixels_right = image.pixel_color(col + 1, row).marshal_dump
        grey_right = (pixels_right[:red] + pixels_right[:green] + pixels_right[:blue]) / 3

        if grey_left > grey_right
          result |= (1<<count)
        end

        count+=1
      end
    end

    result
  end

  def self.distance(hash1, hash2)
    (hash1 ^ hash2).to_s(2).count('1')
  end

  def self.similar?(hash1, hash2)
    distance(hash1, hash2) <= 10
  end

end