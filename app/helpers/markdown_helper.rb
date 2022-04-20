module MarkdownHelper
  def markdown(content)
    tag.article data: { controller: "markdown-viewer" } do
      content
    end
  end
end