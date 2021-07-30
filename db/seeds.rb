require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'covid_19_data.csv'))
csv = CSV.parse(csv_text, headers: true, encoding: 'utf-8')
covid_observations = csv.map do |row|
  co = {}
  co[:id] = row[row.headers.first]
  co[:observation_date] = Date.strptime(row['observation_date'], '%m/%d/%Y')
  co[:province] = row['province']
  co[:country] = row['country']
  co[:last_updated] =
    DateTime.strptime(
      row['last_updated'],
      '%m/%d/%Y %H:%M') rescue DateTime.parse(row['last_updated'])
  co[:confirmed] = row['confirmed']
  co[:deaths] = row['deaths']
  co[:recovered] = row['recovered']
  co[:created_at] = DateTime.current
  co[:updated_at] = DateTime.current
  co
end

CovidObservation.upsert_all(covid_observations)
puts "There should now be #{ CovidObservation.count } Covid Observations
      recorded in the databse."
