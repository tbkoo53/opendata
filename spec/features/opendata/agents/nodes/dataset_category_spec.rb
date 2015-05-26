require 'spec_helper'

describe "opendata_agents_nodes_dataset_category", dbscope: :example do
  let(:site) { cms_site }
  let(:node) { create_once :opendata_node_dataset_category }
  before do
    create_once :opendata_node_category, basename: "bunya/kurashi"
    create_once :opendata_node_search_dataset, basename: "dataset/search"
  end

  let(:index_path) { "#{node.url}/kurashi" }
  let(:rss_path) { "#{node.url}/kurashi/rss.xml" }
  let(:nothing_path) { "#{node.url}index.html" }

  it "#index" do
    page.driver.browser.with_session("public") do |session|
      session.env("HTTP_X_FORWARDED_HOST", site.domain)
      session.env("REQUEST_PATH", index_path)
      visit index_path
      expect(current_path).to eq index_path
    end
  end

  it "#rss" do
    page.driver.browser.with_session("public") do |session|
      session.env("HTTP_X_FORWARDED_HOST", site.domain)
      session.env("REQUEST_PATH", rss_path)
      visit rss_path
      expect(current_path).to eq rss_path
    end
  end

  it "#nothing" do
    page.driver.browser.with_session("public") do |session|
      session.env("HTTP_X_FORWARDED_HOST", site.domain)
      session.env("REQUEST_PATH", nothing_path)
      visit nothing_path
      expect(current_path).to eq nothing_path
    end
  end
end
