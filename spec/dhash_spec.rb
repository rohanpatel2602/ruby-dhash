require 'spec_helper'

describe DHash do

  describe 'hash_from_path' do
    subject { DHash.hash_from_path(File.expand_path('../images/in_flames2.jpg', __FILE__)) }

    it 'should load the image given a path' do
      DHash.should_receive(:hash_from_image)
      subject
    end
  end

  describe 'hash_from_blob' do
    subject { DHash.hash_from_blob(File.read(File.expand_path('../images/in_flames2.jpg', __FILE__))) }

    it 'should load the image given a blob' do
      DHash.should_receive(:hash_from_image)
      subject
    end
  end

  describe 'hash_from_image' do
    let(:path) { File.expand_path('../images/in_flames2.jpg', __FILE__) }
    let(:image) { Magick::Image.read(path).first }

    it 'should calculate the dhash of an image' do
      hash = DHash.hash_from_image(image)
      hash.should == 14605438543144808556
    end
  end

  describe 'distance' do
    let(:hash1) { 14605438543144808556 }
    let(:hash2) { 14605438543144808555 }

    it 'should compare two hashes and return the hamming distance' do
      distance = DHash.distance(hash1, hash2)
      distance.should == 3
    end

    describe 'when the hashes are identical' do

      it 'should return 0' do
        distance = DHash.distance(hash1, hash1)
        distance.should == 0
      end

    end
  end

  describe 'similar?' do
    let(:flames1) { File.expand_path('../images/in_flames1.jpg', __FILE__) }
    let(:flames2) { File.expand_path('../images/in_flames2.jpg', __FILE__) }
    let(:flames3) { File.expand_path('../images/in_flames3.jpg', __FILE__) }
    let(:wrath) { File.expand_path('../images/wrath.jpg', __FILE__) }

    describe 'when given two identical images' do
      it 'should return true' do
        DHash.similar?(DHash.hash_from_path(flames2), DHash.hash_from_path(flames2)).should == true
      end
    end

    describe 'when given one image that is a resized version of another' do
      it 'should return true' do
        DHash.similar?(DHash.hash_from_path(flames1), DHash.hash_from_path(flames2)).should == true
      end
    end

    describe 'when given two similar images' do
      it 'should return true' do
        DHash.similar?(DHash.hash_from_path(flames1), DHash.hash_from_path(flames3)).should == true
      end
    end

    describe 'when given two different images' do
      it 'should return false' do
        DHash.similar?(DHash.hash_from_path(flames1), DHash.hash_from_path(wrath)).should == false
      end
    end
  end

end