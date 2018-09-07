[![CircleCI](https://circleci.com/gh/clerb/clerb-rails.svg?style=shield)](https://circleci.com/gh/clerb/clerb-rails)

# clerb-rails

clerb-rails is the [website](https://www.clevelandrb.com) for the Cleveland Ruby Brigade, built with Ruby on Rails.

## Development

### Setup

1. Clone the repository (`git clone https://github.com/clerb/clerb-rails.git`)
2. Install gems: `bundle install`
3. Install npm packages: `yarn install`
4. Start the Rails server: `bundle exec rails s`
5. Visit [http://localhost:3000](http://localhost:3000) in your browser

### Google Maps setup

The event details page contains an embedded Google Map of the event location. Google's maps API requires an authenticated API token for embeds to work. To set this up for development:

1. Visit the [Google developer console](https://console.developers.google.com)
2. Click the project dropdown in the top left and select "New Project" in the modal. Name it something like "CLERB-dev" (doesn't really matter)
3. Search for "Maps Embed API", click on the result, and select "Enable"
4. Click the "Credentials" tab. Select "Create credentials" -> "API key" and copy the generated key
5. Create a file named `.env` in the Rails project directory with the following contents:

```
GOOGLE_MAPS_API_KEY=<your_copied_key>
```

## Contributing

1. Fork it (https://github.com/clerb/clerb-rails.com/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new pull request on GitHub
