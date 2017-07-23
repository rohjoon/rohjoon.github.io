class Jekyll::Converters::Markdown::GithubMarkup
  def initialize(config)
    require 'github/markup'
    @config = config
  rescue LoadError
    STDERR.puts 'You are missing a library required for Markdown. Please add'
    STDERR.puts 'gem "github-markup", "1.6.0"'
    STDERR.puts 'on your Gemfile:'
    raise LoadError.new("Missing dependency: github-markup")
  end

  def convert(content)
      GitHub::Markup.render_s(GitHub::Markups::MARKUP_MARKDOWN, content)
  end
end

