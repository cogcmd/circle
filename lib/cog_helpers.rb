class CogHelpers
  def self.output_json_with_template(json, template)
    puts "COG_TEMPLATE: #{template}"
    puts "JSON"
    puts ""
    print json
  end
end
