require 'json'
require 'airtable'
require 'active_support/all'
# require 'active_support/all'

# Pass in api key to client
@client = Airtable::Client.new("keyRTLlrVS02vC3Vx")
# Pass in the app key and table name


# Sermons

@table = @client.table("apprDNNyNO4RHDP1q", "sermons")
@records = @table.records(:filterByFormula => "published", :sort => ["date", :desc], :limit => 100)

File.open("_data/sermons.json", "w") do |f|
    data = @records.map { |record| record.attributes }
    f.write(data.to_json)
end



