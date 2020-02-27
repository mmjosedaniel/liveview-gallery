defmodule GalleryWeb.Router do
  use GalleryWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GalleryWeb do
    pipe_through :browser

    get "/", PageController, :index
    live "/gallery", GalleryLive
    live "/counter", CounterLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", GalleryWeb do
  #   pipe_through :api
  # end
end
