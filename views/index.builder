xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title       "#{@repo} -- Latest Issues"
    xml.description "#{@repo} -- Latest Issues"
    xml.link        "https://github.com/#{@repo}/issues"

    for issue in @issues
      xml.item do
        xml.title       "#{issue['number']}: #{issue['title']}"
        xml.description issue['body']
        xml.pubDate     DateTime.parse(issue['created_at']).rfc822
        xml.link        issue['html_url']
      end
    end
  end
end
