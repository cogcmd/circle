class CircleUrl
  DEFAULT_LIMIT=10

  def initialize(project, limit=DEFAULT_LIMIT)
    @project = project
    @limit = limit
  end

  def generate
    URI("https://circleci.com/api/v1/project/#{organization}/#{project}?circle-token=#{token}&limit=#{limit}&offset=5&filter=completed")
  end

  private

  attr_reader :project, :limit

  def token
    ENV.fetch("CIRCLE_API_TOKEN")
  end

  def organization
    ENV.fetch("CIRCLE_ORGANIZATION")
  end
end
