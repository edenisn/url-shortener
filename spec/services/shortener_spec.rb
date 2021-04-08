require 'rails_helper'

RSpec.describe Shortener do
  context 'URL present' do
    before(:each) do
      @url = 'https://www.example.com/blog/what-is-going-on'
    end

    it 'should shortens a given URL to a 11 characters' do
      shortener = Shortener.new(@url)
      expect(shortener.call.length).to eq 11
    end
  end

  context 'URL is not present' do
    it 'should shortens a given URL to a 10 characters' do
      shortener = Shortener.new(nil)
      expect(shortener.call).to eq nil
    end
  end
end
