class CircleUrl
  DEFAULT_LIMIT=10

  def initialize(project, limit=DEFAULT_LIMIT)
    @project = project
    @limit = limit
  end

  def list
    URI("#{base_url}?circle-token=#{token}&limit=#{limit}&offset=5&filter=completed")
  end

  def build_branch(branch)
    URI("#{base_url}/tree/#{branch}?circle-token=#{token}")
  end

  private

  attr_reader :project, :limit

  def base_url
    "https://circleci.com/api/v1/project/#{organization}/#{project}"
  end

  def token
    ENV.fetch("CIRCLE_API_TOKEN")
  end

  def organization
    ENV.fetch("CIRCLE_ORGANIZATION")
  end
end
