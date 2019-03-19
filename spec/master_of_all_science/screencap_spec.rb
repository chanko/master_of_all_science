require 'spec_helper'

RSpec.describe MasterOfAllScience::Screencap do
  it 'return an empty array' do
    VCR.use_cassette('empty') do
      results = MasterOfAllScience::Screencap.search('asdf')

      expect(results).to be_empty
    end
  end

  it 'returns multiple screencaps' do
    VCR.use_cassette('search') do
      results = MasterOfAllScience::Screencap.search('All right, all right, cool it!')

      expect(results.size).to eq(36)
      expect(results.first).to be_a(MasterOfAllScience::Screencap)
    end
  end

  it 'returns correct image url' do
    VCR.use_cassette('search') do
      screencap = MasterOfAllScience::Screencap.search('All right, all right, cool it!').first

      expect(screencap.image_url).to eq('https://masterofallscience.com/img/S02E01/427010.jpg')
    end
  end

  it 'returns correct caption' do
    VCR.use_cassette('caption') do
      screencap = MasterOfAllScience::Screencap.search('Listen, Morty').first

      expect(screencap.caption).to eq("Ugh! Take a shower with\nme, Morty. What?! Listen\nto me, Morty. Get your\nclothes off and get in\nthe shower right now.")
    end
  end

  it 'returns correct meme url' do
    VCR.use_cassette('meme') do
      screencap = MasterOfAllScience::Screencap.search('Listen, Morty').first

      expect(screencap.meme_url).to eq('https://masterofallscience.com/meme/S01E04/156948.jpg?b64lines=VWdoISBUYWtlIGEgc2hvd2VyIHdpdGgKbWUsIE1vcnR5LiBXaGF0PyEgTGlzdGVuCnRvIG1lLCBNb3J0eS4gR2V0IHlvdXIKY2xvdGhlcyBvZmYgYW5kIGdldCBpbgp0aGUgc2hvd2VyIHJpZ2h0IG5vdy4=')
    end
  end

  it 'allows a custom caption for a meme' do
    VCR.use_cassette('meme') do
      screencap = MasterOfAllScience::Screencap.search('Listen, Morty').first

      expect(screencap.meme_url('CUSTOM CAPTION GOES HERE')).to eq('https://masterofallscience.com/meme/S01E04/156948.jpg?b64lines=Q1VTVE9NIENBUFRJT04gR09FUyBIRVJF')
    end
  end

  it 'allows captions as arrays' do
    VCR.use_cassette('meme') do
      screencap = MasterOfAllScience::Screencap.search('Listen, Morty').first

      expect(screencap.meme_url(['CUSTOM CAPTIONS', 'GO HERE'])).to eq('https://masterofallscience.com/meme/S01E04/156948.jpg?b64lines=Q1VTVE9NIENBUFRJT05TCkdPIEhFUkU=')
    end
  end

  it 'returns a random screencap' do
    VCR.use_cassette('search') do
      screencap = MasterOfAllScience::Screencap.random('Listen, Morty')

      expect(screencap).to be_a(MasterOfAllScience::Screencap)
    end
  end

  it 'returns nil when random returns nothing' do
    VCR.use_cassette('empty') do
      screencap = MasterOfAllScience::Screencap.random('asdf')

      expect(screencap).to be_nil
    end
  end
end
