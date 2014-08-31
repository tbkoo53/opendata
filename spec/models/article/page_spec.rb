require 'spec_helper'

describe Article::Page do
  subject(:model) { Article::Page }
  subject(:factory) { :article_page }
  
  it_behaves_like "mongoid#save", presence: %w[name state filename]
  it_behaves_like "mongoid#save"
  it_behaves_like "mongoid#find"

  describe "#attributes" do
    subject(:item) { model.first }
    
    it { expect(item.becomes_with_route).not_to eq nil }
    it { expect(item.dirname).not_to eq nil }
    it { expect(item.basename).not_to eq nil }
    it { expect(item.path).not_to eq nil }
    it { expect(item.url).not_to eq nil }
    it { expect(item.full_url).not_to eq nil }
    it { expect(item.public?).not_to eq nil }
    #it { expect(item.node).not_to eq nil }
  end
end
