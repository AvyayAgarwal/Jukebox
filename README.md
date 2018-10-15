# Jukebox

#### This application was created for the Shopify Data Engineering Internship Challenge

A Ruby on Rails application that uses the Spotify API to provide you an analysis of the progression of your Spotify library based on the danceability and energy of songs.

This application is intended to provide you an insight into the your Spotify library and allow you to customize it according to how you want it to progress (say if you want to play it for a house party).

##### Screenshots of a crude version of the application:
![Landing_Page](https://github.com/AvyayAgarwal/Jukebox/blob/master/screenshots/Landing_Page.jpeg "Landing_Page")
![Graph](https://github.com/AvyayAgarwal/Jukebox/blob/master/screenshots/Graph.png "Graph")
![Show_Library](https://github.com/AvyayAgarwal/Jukebox/blob/master/screenshots/Show_Library.png "Show_Library")

##### TODO:
I am working on adding the option to analyze your playlists as well so that your library/playlists can be curated based on mood or occasion. I personally use my library as a store for all my songs and thereafter curate different playlists and believe this to be a really important feature that needs to be added.

## Development vs Production Deployment:

### Development

The application currently works in development mode by simply booting up a rails server. However, it may not work in your case due to missing keys for the Spotify API. After cloning the repository, follow these steps to get it running yourself:
1. Create a Spotify developer account [here](https://developer.spotify.com/)
2. Create a new project and add `http://localhost:3000/auth/spotify/callback` as a redirect URI in the project settings
3. Create a file `/config/env.yml` and set the project's Client ID and Secret keys as environment variables in this file. (Note: Do not publish this file to a public repository)
4. Now you may simply do a `bundle install` and then run the rails server to find the app listening on port 3000


### Deployment

I am currently facing issues with correctly dockerizing and deploying it to a production environment on the Google Kubernetes Engine.

Initially, I ran into issues related to proper docker configuration for Ruby on Rails for a production environment even though the very same configurations ran perfectly on a development environment.

I had tried writing my own `Dockerfile` and `docker-compose.yml` files as well as using open-source resources such as Shopify's [hello-docker-rails](https://github.com/Shopify/hello-docker-rails/), tzumby's [rails-on-kubernetes](https://github.com/tzumby/rails-on-kubernetes) and bitnami's [bitnami-docker-rails](https://github.com/bitnami/bitnami-docker-rails).

However, I ran into different issues with production deployment of this application and am currently working on resolving issues such as the following:

![Error_GCP](https://github.com/AvyayAgarwal/Jukebox/blob/master/screenshots/Error_GCP.jpeg "Error_GCP")
![Error_Prod](https://github.com/AvyayAgarwal/Jukebox/blob/master/screenshots/Error_Prod.png "Error_Prod")