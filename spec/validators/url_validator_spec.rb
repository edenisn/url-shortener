require 'rails_helper'

RSpec.describe UrlValidator do
  context 'URL is correct' do
    before(:each) do
      url = 'https://www.example.com/test-url'
      @link = Link.new(url: url)
    end

    it 'should not return errors' do
      expect(@link).to be_valid
    end
  end

  context 'URL is not correct' do
    before(:each) do
      @link = Link.new(url: 'ht//invalid_url')
    end

    it 'should return errors' do
      expect(@link).not_to be_valid
    end
  end
end
